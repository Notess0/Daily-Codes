#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

class Calculator {
private:
    std::vector<int> numbers;

public:
    void addNumber(int n) {
        numbers.push_back(n);
    }

    int sum() const {
        int total = 0;
        for (int n : numbers) {
            total += n;
        }
        return total;
    }

    int average() const {
        if (numbers.empty()) return 0;
        return sum() / static_cast<int>(numbers.size());
    }

    int findMax() const {
        if (numbers.empty()) return 0;
        return *std::max_element(numbers.begin(), numbers.end());
    }

    void displayNumbers() const {
        std::cout << "Numbers: ";
        for (int n : numbers) {
            std::cout << n << " ";
        }
        std::cout << "\n";
    }

    void clear() {
        numbers.clear();
    }
};

int main() {
    Calculator calc;

    calc.addNumber(15);
    calc.addNumber(25);
    calc.addNumber(35);
    calc.addNumber(10);

    calc.displayNumbers();
    std::cout << "Sum: " << calc.sum() << "\n";
    std::cout << "Average: " << calc.average() << "\n";
    std::cout << "Maximum: " << calc.findMax() << "\n";

    return 0;
}
