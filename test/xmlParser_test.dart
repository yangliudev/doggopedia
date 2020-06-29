import 'package:test/test.dart';

import 'package:doggopedia/wiki_api/dogBreeds.dart';
import 'package:doggopedia/wiki_api/xmlParser.dart';

void main() {
  test('find null dog breed detail', () async {
    assert(DogBreeds.getDogBreeds() == null);
    await XmlParser.loadDogBreeds();
    assert(DogBreeds.getDogBreeds() != null);
    assert(DogBreeds.getDogBreeds().isNotEmpty);

    for (var dogBreed in DogBreeds.getDogBreeds()) {
      await XmlParser.addDetails(dogBreed, false);
      if (dogBreed.detail == null) {
        print(dogBreed);
      }
    }
  });
}