#include <iostream>
#include <string>
#include <vector>

using namespace std;

int main() {
  string str = "hello";
  vector<string> vec;

  vec.push_back(str);
  cout << "After vec.push_back(str) str=" << str << endl;

  vec.push_back(move(str));
  cout << "After vec.push_back(move(str)) str=" << str << endl;

  str = "word";
  cout << "重新赋值后 str=" << str << endl;
  return 0;
}
