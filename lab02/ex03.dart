/**
 * Task: Pentru un string s sa se afiseze prima litera care nu se repeta in string. Daca toate literele se repeta, se va afisa -1.
 */

const String NO_LETTER = "-1";
const int LETTER_COUNT = 26;

void printFirstUniqueLetter(String str) {
  List<int> freqLetterList = List.filled(LETTER_COUNT, 0);
  for (int i = 0; i < str.length; ++i) {
    int letterIdx = str.codeUnitAt(i) - 'a'.codeUnitAt(0);
    ++freqLetterList[letterIdx];
  }

  String letter = NO_LETTER;
  for (int i = 0; i < str.length; ++i) {
    int letterIdx = str.codeUnitAt(i) - 'a'.codeUnitAt(0);
    if (freqLetterList[letterIdx] == 1) {
      letter = str[i];
      break;
    }
  }

  print(letter);
}

void main() {
  printFirstUniqueLetter("abcac");
}
