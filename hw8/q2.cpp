#include <iostream>
using namespace std;

template <class T>

void printIt(T a, T b) {
  T c = a + b;
  cout << "You gave me " << a << " and " << b << "." << endl;
  cout << "Together they make " << c << "." << endl;
}

int main() {
  int a1 = 1.0;
  int a2 = 2.0;
  printIt(a1,a2);

  double b1 = 1.0;
  double b2 = 2.0;
  printIt(b1, b2);

  string c1 = "Oh ";
  string c2 = "noes!";
  printIt(c1, c2);
}
