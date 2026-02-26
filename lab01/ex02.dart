/**
 * Task: Write a Dart program that extracts all words from a phrase and prints only the longest word(s).
 */

String WHITE_SPACES = " \r\n\t";

/**
 * Returns the list of words and the length of the biggest words.
 */
(List<String>, int) extractWords(String phrase) {
  List<String> words = <String>[];
  int biggestSize = 0, size = 0;

  // Added one more iteration that is responsible solely for the last word of the phrase.
  for (int i = 0; i <= phrase.length; ++i) {
    if (i != phrase.length && (!WHITE_SPACES.contains(phrase[i]))) {
      ++size;
    } else {
      if (size > 0) {
        String newWord = phrase.substring(i - size, i);
        words.add(newWord);
      }

      if (size > biggestSize) {
        biggestSize = size;
      }
      size = 0;
    }
  }

  return (words, biggestSize);
}

void printLongestWords(List<String> words, int biggestSize) {
  for (int i = 0; i < words.length; ++i) {
    if (words[i].length == biggestSize) {
      print(words[i]);
    }
  }
}

void main() {
  var (words, biggestSize) = extractWords("test phrase 1234 for cool people");
  print(words);
  printLongestWords(words, biggestSize);
}
