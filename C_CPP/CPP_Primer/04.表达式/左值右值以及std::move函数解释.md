# C++ 左值右值以及std::move函数解释

## 左值和右值

**左值，右值顾名思义就是在一个赋值语句左边或者右边的值**，在C++语言中，二者是有区别的，左值是指表达式可以被取址的值，即表达式返回的是一个可以在内存中存储的位置;右值是指表达式返回的是临时值，没有确定的内存地址，不能被取址。
可以归纳为：

- 当一个对象被用作右值的时候，用的是对象的值（内容）
- 当对象被用作左值的时候，用的是对象的本身（在内存中的地址）

实例：

```cpp
int x = 5;  // x 是一个左值，可以被取址
int array[5];  // array 是一个左值，可以被取址
```

```cpp
int result = 3 + 4;  // 3 + 4 是一个右值，不可以被取址
```

## 左值引用和右值引用

- 左值引用是指用于引用左值的引用类型。左值引用只能绑定到左值，不能绑定到右值。它使用 & 符号表示
- 右值引用是指用于引用右值的引用类型。右值引用只能绑定到右值，不能绑定到左值。它使用 && 符号表示

```ccp
int x = 5;
int& ref_x = x;  // ref_x 是对 x 的左值引用
```

```cpp
int&& ref_rvalue = 3 + 4;  // ref_rvalue 是对 3 + 4 的右值引用
```

## std::move

`std::move` 是 C++ 中的一个标准库函数，用于将一个左值转换为右值引用。相当于告诉编译器：我们有一个左值，但我们希望像一个右值一样处理它
函数原型为：

```cpp
typename std::remove_reference<T>::type&& std::move(T&& arg)
```

**注意！！！使用 std::move 之后，对象会被“掏空”，也就是说它是没有内容的。如果想继续使用，就需要重新赋值**

```cpp
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
```

```bash
After vec.push_back(str) str=hello
After vec.push_back(move(str)) str=
重新赋值后 str=word
```

为什么要使用 std::move ？

std::move 将对象的状态或者所有权从一个对象转移到另一个对象，只是转移，没有内存的搬迁或者内存拷贝所以可以提高利用效率,改善性能；
比如vector::push_back 等这类函数时,会对参数的对象进行复制,连数据也会复制.这就会造成对象内存的额外创建, 本来原意是想把参数push_back进去就行了,通过std::move，可以避免不必要的拷贝操作。
