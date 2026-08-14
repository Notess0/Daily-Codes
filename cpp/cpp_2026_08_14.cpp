#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

class Calculator {
private:
    std::vector<int> numbers;

public:
    void addNumber(int num) {
        numbers.push_back(num);
    }

    int sum() const {
        int total = 0;
        for (int num : numbers) {
            total += num;
        }
        return total;
    }

    int average() const {
        if (numbers.empty()) return 0;
        return sum() / static_cast<int>(numbers.size());
    }

    int maximum() const {
        if (numbers.empty()) return 0;
        return *std::max_element(numbers.begin(), numbers.end());
    }

    void display() const {
        std::cout << "Numbers: ";
        for (int num : numbers) {
            std::cout << num << " ";
        }
        std::cout << "\n";
    }
};

int main() {
    Calculator calc;
    
    calc.addNumber(10);
    calc.addNumber(20);
    calc.addNumber(30);
    calc.addNumber(15);
    
    calc.display();
    std::cout << "Sum: " << calc.sum() << "\n";
    std::cout << "Average: " << calc.average() << "\n";
    std::cout << "Maximum: " << calc.maximum() << "\n";
    
    return 0;
}
