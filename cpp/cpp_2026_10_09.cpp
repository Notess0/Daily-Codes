#include <iostream>
#include <vector>
#include <algorithm>
#include <random>

int main() {
    std::vector<int> numbers;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 100);
    
    std::cout << "Generating 10 random numbers:\n";
    for (int i = 0; i < 10; ++i) {
        int num = dis(gen);
        numbers.push_back(num);
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    std::cout << "Sorted numbers:\n";
    std::sort(numbers.begin(), numbers.end());
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    int sum = 0;
    for (int num : numbers) {
        sum += num;
    }
    double average = static_cast<double>(sum) / numbers.size();
    
    std::cout << "Sum: " << sum << "\n";
    std::cout << "Average: " << average << "\n";
    std::cout << "Min: " << numbers.front() << "\n";
    std::cout << "Max: " << numbers.back() << "\n";
    
    return 0;
}
