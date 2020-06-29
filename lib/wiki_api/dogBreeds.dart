import 'package:doggopedia/wiki_api/dogBreed.dart';

class DogBreeds {
    static List<DogBreed> dogBreeds;

    static void add(DogBreed dogBreed) {
        if (dogBreeds == null) {
          dogBreeds = new List();
        }
        dogBreeds.add(dogBreed);
    }

    static List<DogBreed> getDogBreeds() {
        return dogBreeds;
    }
}