#include <iostream>
using namespace std;

class Vehicle {
public:
  int x;
  virtual void f();
  void g();
};

class Airplane : public Vehicle {
public:
  int y;
  virtual void f();
  virtual void h();
};

void Vehicle::f() {
  cout << "Vehicle::f says x is " << x << endl;
}

void Vehicle::g() {
  cout << "Vehicle::g" << endl;
}

void Airplane::f() {
  cout << "Airplane::f says x is " << x << endl;
}

void Airplane::h() {
  cout << "Airplane::h says y is " << y << endl;
}

void inHeap() {
  Vehicle *b1 = new Vehicle;
  Airplane *d1 = new Airplane;
  /* location 1 */
  b1->x = 1;
  d1->x = 2;
  d1->y = 3;
  b1 = d1;
  b1->f();
  b1->g();
  d1->f();
  d1->h();
  d1->g();
  /* location 2 */
}

void onStack() {
  Vehicle b2;
  Airplane d2;
  /* location 3 */
  b2.x = 4;
  d2.x = 5;
  d2.y = 6;
  b2 = d2;
  b2.f();
  b2.g();
  d2.f();
  d2.h();
  /* location 4 */
}

int main() {
  inHeap();
  onStack();

}
