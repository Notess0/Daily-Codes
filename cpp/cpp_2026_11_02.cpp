#include <iostream>
#include <vector>
#include <algorithm>
#include <random>

int main() {
    std::vector<int> numbers;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 100);
    
    std::cout << "Generating 10 random numbers between 1 and 100:\n";
    for (int i = 0; i < 10; ++i) {
        int num = dis(gen);
        numbers.push_back(num);
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    int sum = 0;
    for (int num : numbers) {
        sum += num;
    }
    double average = static_cast<double>(sum) / numbers.size();
    
    std::cout << "Sum: " << sum << "\n";
    std::cout << "Average: " << average << "\n\n";
    
    std::sort(numbers.begin(), numbers.end());
    std::cout << "Sorted numbers: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    int max_num = *std::max_element(numbers.begin(), numbers.end());
    int min_num = *std::min_element(numbers.begin(), numbers.end());
    
    std::cout << "Maximum: " << max_num << "\n";
    std::cout << "Minimum: " << min_num << "\n";
    
    return 0;
}
