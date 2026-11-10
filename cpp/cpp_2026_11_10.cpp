#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

int main() {
    std::vector<int> numbers = {64, 34, 25, 12, 22, 11, 90, 88};
    
    std::cout << "Original array: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    std::sort(numbers.begin(), numbers.end());
    std::cout << "Sorted array: ";
    for (int num : numbers) {
        std::cout << num << " ";
    }
    std::cout << "\n\n";
    
    auto max_it = std::max_element(numbers.begin(), numbers.end());
    auto min_it = std::min_element(numbers.begin(), numbers.end());
    
    std::cout << "Maximum element: " << *max_it << "\n";
    std::cout << "Minimum element: " << *min_it << "\n\n";
    
    int sum = 0;
    for (int num : numbers) {
        sum += num;
    }
    double average = static_cast<double>(sum) / numbers.size();
    
    std::cout << "Sum: " << sum << "\n";
    std::cout << "Average: " << average << "\n\n";
    
    int search_value = 22;
    auto result = std::find(numbers.begin(), numbers.end(), search_value);
    
    if (result != numbers.end()) {
        std::cout << search_value << " found in array at position " 
                  << std::distance(numbers.begin(), result) << "\n";
    } else {
        std::cout << search_value << " not found in array\n";
    }
    
    return 0;
}
