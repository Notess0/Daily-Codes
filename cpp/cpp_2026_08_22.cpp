#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

int main() {
    std::vector<int> numbers = {42, 15, 8, 23, 16, 4, 9, 31, 5, 12};
    
    std::cout << "Original vector: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    std::sort(numbers.begin(), numbers.end());
    std::cout << "Sorted vector: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    auto even_count = std::count_if(numbers.begin(), numbers.end(), 
                                     [](int n) { return n % 2 == 0; });
    std::cout << "Count of even numbers: " << even_count << "\n";
    
    auto odd_count = std::count_if(numbers.begin(), numbers.end(), 
                                    [](int n) { return n % 2 != 0; });
    std::cout << "Count of odd numbers: " << odd_count << "\n\n";
    
    int sum = 0;
    for (int num : numbers) {
        sum += num;
    }
    std::cout << "Sum of all numbers: " << sum << "\n";
    std::cout << "Average: " << static_cast<double>(sum) / numbers.size() << "\n\n";
    
    int max_val = *std::max_element(numbers.begin(), numbers.end());
    int min_val = *std::min_element(numbers.begin(), numbers.end());
    std::cout << "Maximum: " << max_val << "\n";
    std::cout << "Minimum: " << min_val << "\n";
    
    return 0;
}
