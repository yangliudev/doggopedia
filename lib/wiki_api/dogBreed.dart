class DogBreed {
    String id;
    String href;
    String title;
    String text;
    String img = 'https://www.tabithaknowel.com/integrated/uploads/2017/05/noPhotoFound.png'; //this is the default image
    String detail;

    DogBreed(String href, String title, String text) {
      this.href = href;
      this.title = title;
      this.text = text;
      this.id = hrefToId(href);
    }

    @override
    String toString() {
      return "id: " + id + ", href: " + href + ", title: " + title 
        + ", text: " + text + "\n" 
        + "img: " + (img == null ? "null" : img) + "\n"
        + "detail: " + (detail == null ? "null" : detail);
    }

    static String hrefToId(String href) {
      String id = href.substring(href.lastIndexOf("/") + 1);
      return id;
    }
}