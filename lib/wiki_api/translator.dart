import 'dart:collection';

class Translator {
    static Map<String, String> _dictionary = _createDictionary();
    // Belgian Shepherd Dog: Groenendael => Belgian Shepherd Dog, Groenendael
    // Belgian Shepherd Dog: Laekenois => Belgian Shepherd Dog, Laekenois
    // Belgian Shepherd Dog: Malinois => Belgian Shepherd Dog, Malinois
    // Belgian Shepherd Dog: Tervuren => Belgian Shepherd Dog, Tervuren
    // Brittany (dog) => Brittany
    // Drentse Patrijshond => Drentsche Patrijshond
    // English Toy Terrier (Black & Tan) => English Toy Terrier
    // Gran Mastín de Borínquen => Gran Mastín de Borinquen, Gran Mastin de Borínquen, Gran Mastin de Borinquen
    // Grand Anglo-Français Tricolore => Grand Anglo-Francais Tricolore
    // Istrian Shorthaired Hound => Istrian Short-haired Hound
    // Kuchi (dog) => Kuchi
    // Perro de Pastor Mallorquin => Perro de Pastor Mallorquín
    // Ratonero Mallorquin => Ratonero mallorquín
    // Saint Hubert Jura Hound => St. Hubert Jura Hound
    // Shar Pei => Shar-Pei
    // Slovakian Wirehaired Pointer => Slovak Wirehaired Pointer
    // Slovenský cuvac => Slovak Cuvac
    // Smalandstövare => Smålandsstövare
    // South Russian Ovcharka => South Russian Sheepdog
    // Terrier Brasileiro => Brazilian Terrier
    // Saint John's water dog => St. John's water dog
    static var DOG_BREED_TEXT_PAIRS = [
      [ "Belgian Shepherd Dog: Groenendael", "Groenendael" ],
      [ "Belgian Shepherd Dog: Laekenois", "Laekenois" ],
      [ "Belgian Shepherd Dog: Malinois", "Malinois" ],
      [ "Belgian Shepherd Dog: Tervuren", "Tervuren" ],
      [ "Brittany (dog)", "Brittany"],
      [ "Drentse Patrijshond", "Drentsche Patrijshond"],
      [ "English Toy Terrier (Black & Tan)", "English Toy Terrier"],
      [ "Gran Mastín de Borínquen", "Gran Mastín de Borinquen"],
      [ "Grand Anglo-Français Tricolore", "Grand Anglo-Francais Tricolore"],
      [ "Istrian Shorthaired Hound", "Istrian Short-haired Hound"],
      [ "Kuchi (dog)", "Kuchi"],
      [ "Perro de Pastor Mallorquin", "Perro de Pastor Mallorquín"],
      [ "Ratonero Mallorquin", "Ratonero mallorquín"],
      [ "Saint Hubert Jura Hound", "St. Hubert Jura Hound"],
      [ "Shar Pei", "Shar-Pei"],
      [ "Slovakian Wirehaired Pointer", "Slovak Rough-haired Pointer"],
      [ "Slovenský cuvac", "Slovak Cuvac"],
      [ "Smalandstövare", "Smålandsstövare"],
      [ "South Russian Ovcharka", "South Russian Sheepdog"],
      [ "Terrier Brasileiro", "Brazilian Terrier"],
      [ "Saint John's water dog", "St. John's water dog"],
      [ "Galician Shepherd Dog", "Can de Palleiro"]
    ];

    static Map<String, String> _createDictionary() {
      Map dictionary = HashMap<String, String>();
      for (var dogBreedTextPair in DOG_BREED_TEXT_PAIRS) {
        var originalText = dogBreedTextPair[0];
        var translatedText = dogBreedTextPair[1];
        dictionary.putIfAbsent(originalText, () => translatedText);
      }
      return dictionary;
    }

    static String translate(String originalText) {
      var translatedText = _dictionary[originalText];
      return translatedText;
    }
}