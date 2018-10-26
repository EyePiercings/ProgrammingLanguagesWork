#include <iostream>
#include <functional>
using namespace std;

/*
 * Takes a swapper lambda, an array length, and an array, and
 * swaps each pair of elements from the beginning to the end.
 * This function swaps the elements in-place, modifying the
 * original array.
 */
void swapper(std::function<void(int*,int*)> swap, int array_len, int arr[], int len) {
  /* your implementation here */
  if(!(len == array_len-1)) {
    swap(&arr[len], &arr[len+1]);
    swapper(swap, array_len, arr, len+1);
  }
}

/*
 * Checks that arrays a1 and a2 contain the same numbers
 * in the same order.
 */
bool same(int a1[], int a2[], int array_len) {
  bool ok = true;
  for (int i = 0; i < array_len; i++) {
    ok = ok && a1[i] == a2[i];
  }
  return ok;
}

/*
 * Copies an integer array into a destination buffer.
 */
int *acopy(int *dest, int *src, int len) {
  if (dest == NULL) {
    dest = (int*)malloc(sizeof(int) * len);
  }
  for (int i = 0; i < len; i++) {
    dest[i] = src[i];
  }
  return dest;
}

/*
 * Prints an integer array to the console.
 */
void aprint(int *a, int len) {
  for (int i = 0; i < len; i++) {
    cout << a[i];
    if (i < len - 1) {
      cout << ", ";
    }
  }
  cout << endl;
}

int main() {
  /*
   * Takes pointers to two integers and swaps them.
   */
  auto swap =
    [](int *a, int *b) {
      int tmp = *a;
      *a = *b;
      *b = tmp;
    };

  /* sample swap lambda usage
     int a = 1;
     int b = 2;
     swap(&a,&b);
  */

  int len = 100;
  int arr[] = { 446,366,1008,537,938,14,194,277,356,27,906,814,112,231,981,420,78,356,615,208,648,259,270,727,717,71,67,20,24,579,937,654,354,312,390,822,368,176,673,906,827,533,903,100,231,712,497,165,240,423,288,839,173,701,221,1022,73,216,833,569,599,33,505,1013,940,384,4,239,782,337,562,249,432,226,887,874,431,842,372,44,638,439,430,389,874,704,292,394,478,190,267,958,393,433,967,814,763,77,694,958 };
  int *arr2 = acopy(NULL, arr, len);

  /*
   * Ugly swap.  Your code should do the same as the following.
   */
  for (int i = 0; i < len - 1; i++) {
    swap(&arr[i], &arr[i+1]);
  }

  /*
   * Pretty swap.  You need to write this function.
   */
  swapper(swap, len, arr2, 0);

  // If you are successful, everything below will be excellent.
  cout << "arr and arr2";
  if (same(arr, arr2, len)) {
    cout << " are the same! Be excellent to each other!!!";
  } else {
    cout << " are NOT the same! Bogus!!!";
  }
  cout << endl;
}
