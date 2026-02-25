/**
 * Task: Write and compile a Dart program that prints the first 50 Fibonacci numbers. The program should generate the sequence dynamically (not hardcoded values).
 * 
 * Fibonacci elements are indexed starting with 0.
 */

int getFibonacciElement(int index) {
  switch (index) {
    case 0:
      return 0;
    case 1:
      return 1;
    case 2:
      return 1;
    default:
      if (index < 0) {
        throw FormatException("The index must be a natural number.");
      }
  }

  int element = 1, nextElement = 2;
  for (int i = 3; i <= index; ++i) {
    int temp = nextElement;
    nextElement += element;
    element = temp;
  }

  return element;
}

void printFibonacciElements(int count) {
  if (count <= 0) {
    throw FormatException("The count must be a (not null) natural number.");
  }

  print(0);

  int element = 1, nextElement = 1;
  for (int i = 1; i < count; ++i) {
    print(element);
    int temp = nextElement;
    nextElement += element;
    element = temp;
  }
}

void main() {
  printFibonacciElements(50);
}
