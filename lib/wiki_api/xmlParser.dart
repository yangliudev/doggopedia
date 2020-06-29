import 'package:xml/xml.dart';
import 'package:doggopedia/wiki_api/dogBreed.dart';
import 'package:doggopedia/wiki_api/dogBreeds.dart';
import 'package:doggopedia/wiki_api/searchAPI.dart';
import 'package:doggopedia/wiki_api/translator.dart';

class XmlParser {
  static Future<String> loadDogBreeds() async {
    if (DogBreeds.getDogBreeds() != null) {
      return "Success!";
    }

    XmlDocument document = await SearchAPI.search("List_of_dog_breeds");

    var xmlObject = document.children[0];
    for (XmlNode child in xmlObject.children) {
      if (!(child is XmlElement)) {
        continue;
      }

      XmlElement xmlTag = child;

      if (xmlTag.name.toString() != "div" ||
          xmlTag.getAttribute("class") != "div-col columns column-width") {
        continue;
      }

      var list = xmlTag.children[1];

      for (XmlNode listItem in list.children) {
        if (!(listItem is XmlElement)) {
          continue;
        }

        XmlElement elem = listItem.children[0];

        var href = elem.getAttribute("href");
        var title = elem.getAttribute("title");
        var text = elem.text;

        DogBreed dogBreed = new DogBreed(href, title, text);

        DogBreeds.add(dogBreed);
      }
    }

    return "Success!";
  }

  static Future<String> addDetails(DogBreed selectedDogBreed, bool isRedirect) async {
    
    if (selectedDogBreed.detail != null) {
      return "Success!";
    }

    String id = selectedDogBreed.id;

    XmlDocument document = await SearchAPI.search(id);

    bool isImgFound = false;
    bool isDetailFound = false;

    var xmlObject = document.children[0];

    for (XmlNode child in xmlObject.children) {
      if (!(child is XmlElement)) {
        continue;
      }

      XmlElement xmlTag = child;

      if (xmlTag.name.toString() == "table" 
          && xmlTag.attributes[0].toString() == 'class="infobox biota"') {
        var tbody = xmlTag.children[0];
        var rows = tbody.children;
        for (var row in rows) {
          if (isImgFound) {
            break;
          }
          
          var cells = row.children;
          for (var cell in cells) {
            if (cell.children.length > 0 
                && cell.children[0].children.length > 0) {
              var node = cell.children[0].children[0];
              if (!(node is XmlElement)) {
                continue;
              }
              XmlElement tag = node;
              if (tag.name.toString() == "img") {
                // var src = tag.getAttribute("srcset");
                // if (src == null) {
                //   src = tag.getAttribute("src");
                // }
                // int startIndex = 0;
                // if (src.indexOf(", ") != -1) {
                //   startIndex = src.indexOf(", ") + 2;
                // }
                // int endIndex = src.lastIndexOf(" ");
                // if (endIndex != -1) {
                //   src = src.substring(startIndex, endIndex);
                // }
                // selectedDogBreed.img = src;
                _parseImg(selectedDogBreed, tag);
                isImgFound = true;
                break;
              }
            } 
          }
        }
      } else if (xmlTag.name.toString() == "p") {
        var lines = xmlTag.children;
        String detail = "";
        for (var line in lines) {
          detail = detail + line.text;
        }

        var dogBreedText = selectedDogBreed.text;
        if (detail.toLowerCase().contains(dogBreedText.toLowerCase())) {
          isDetailFound = true;
        } else {
          dogBreedText = Translator.translate(dogBreedText);
          if (dogBreedText != null && detail.toLowerCase().contains(dogBreedText.toLowerCase())) {
            isDetailFound = true;
          }
        }

        if (isDetailFound) {
          selectedDogBreed.detail = detail;
        }
      } else if (isRedirect && xmlTag.name.toString() == "div" 
          && xmlTag.getAttribute("class") == "thumb tright") {
        XmlElement imgTag = xmlTag.children[0].children[0].children[0];
        // var srcset = img.getAttribute("srcset");
        // int startIndex = 0;
        // if (srcset.indexOf(", ") != -1) {
        //   startIndex = srcset.indexOf(", ") + 2;
        // }
        // int endIndex = srcset.lastIndexOf(" ");
        // selectedDogBreed.img = "https:" + srcset.substring(startIndex, endIndex);
        _parseImg(selectedDogBreed, imgTag);
        isImgFound = true;
      }

      if (isImgFound && isDetailFound) {
        break;
      }
    }

    if (!isImgFound && !isDetailFound && !isRedirect) {
      // check if this is redirect page
      _parseOnRedirect(selectedDogBreed, document);
      await addDetails(selectedDogBreed, true);
    }

    // if (isDetailFound && !isImgFound) {
    //   String defaultImg = 'https://www.tabithaknowel.com/integrated/uploads/2017/05/noPhotoFound.png';

    //   if (selectedDogBreed.img == null) {
    //     selectedDogBreed.img = defaultImg;
    //   }
    // }
    
    return "Success!";
  }

  static void _parseImg(DogBreed selectedDogBreed, XmlElement imgTag) {
    var src = imgTag.getAttribute("srcset");
    if (src == null) {
      src = imgTag.getAttribute("src");
    }
    int startIndex = 0;
    if (src.indexOf(", ") != -1) {
      startIndex = src.indexOf(", ") + 2;
    }
    int endIndex = src.lastIndexOf(" ");
    if (endIndex != -1) {
      src = src.substring(startIndex, endIndex);
    }
    selectedDogBreed.img = "https:" + src;
  }

  static void _parseOnRedirect(DogBreed selectedDogBreed, XmlDocument document) {
    // parse redirect page
    var xmlObject = document.children[0];

    for (XmlNode child in xmlObject.children) {
      if (!(child is XmlElement)) {
        continue;
      }

      XmlElement xmlTag = child;

      // update selectedDogBreed
      if (xmlTag.name.toString() == "div" && xmlTag.getAttribute("class") == "redirectMsg") {
        var aTag = xmlTag.children[1].children[0].children[0];
        String href = aTag.getAttribute("href");
        String id = DogBreed.hrefToId(href);
        // if there is a #, then remove the #...
        // Sled_dog#Alaskan_husky to Sled_dog
        id = _dropHash(id);
        String title = aTag.getAttribute("title");
        String text = aTag.text;
        text = _dropHash(text);

        selectedDogBreed.href = href;
        selectedDogBreed.id = id;
        selectedDogBreed.title = title;
        selectedDogBreed.text = text;
      }
    }
  }

  static String _dropHash(String s) {
    int index = s.indexOf('#');
    if (index != -1) {
      int startIndex = 0;
      int endIndex = index;
      s = s.substring(startIndex, endIndex);
    }
    return s;
  }
}
