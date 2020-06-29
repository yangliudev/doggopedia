import 'package:test/test.dart';

import 'package:doggopedia/wiki_api/translator.dart';

void main() {
  test('test translator', () {
    for (var dogBreedTextPair in Translator.DOG_BREED_TEXT_PAIRS) {
      var originalText = dogBreedTextPair[0];
      var expectedTranslatedText = dogBreedTextPair[1];
      var actualTranslatedText = Translator.translate(originalText);
      expect(actualTranslatedText, expectedTranslatedText);
    }
  });
}