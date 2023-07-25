#include <iostream>
#include <pthread.h>

// 线程函数，参数为一个整数指针
void* printNumbers(void* arg) {
    int start = *(reinterpret_cast<int*>(arg));
    for (int i = start; i <= start + 4; ++i) {
        std::cout << i << " ";
    }
    std::cout << std::endl;
    // pthread_exit(nullptr);
    // sleep(1);
}

int main() {
    // 定义两个整数变量作为线程参数
    int start1 = 1;
    int start2 = 6;

    // 定义线程 ID
    pthread_t thread1, thread2;

    // 创建线程1和线程2
    int result1 = pthread_create(&thread1, nullptr, printNumbers, &start1);
    int result2 = pthread_create(&thread2, nullptr, printNumbers, &start2);

    if (result1 || result2) {
        std::cerr << "Error creating threads." << std::endl;
        return 1;
    }

    // 主线程等待线程1和线程2完成
    pthread_join(thread1, nullptr);
    pthread_join(thread2, nullptr);

    std::cout << "Both threads have finished." << std::endl;

    return 0;
}
