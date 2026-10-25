#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
};

int main() {
    std::vector<Person> people = {
        {"Alice", 30},
        {"Bob", 25},
        {"Charlie", 35},
        {"Diana", 28}
    };

    std::cout << "Original list:" << std::endl;
    for (const auto& person : people) {
        std::cout << person.name << " - " << person.age << " years old" << std::endl;
    }

    std::sort(people.begin(), people.end(), 
        [](const Person& a, const Person& b) {
            return a.age < b.age;
        });

    std::cout << "\nSorted by age:" << std::endl;
    for (const auto& person : people) {
        std::cout << person.name << " - " << person.age << " years old" << std::endl;
    }

    auto adults = std::count_if(people.begin(), people.end(),
        [](const Person& p) { return p.age >= 18; });

    std::cout << "\nNumber of adults: " << adults << std::endl;

    return 0;
}
