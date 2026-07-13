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

    std::cout << "Original list:\n";
    for (const auto& person : people) {
        std::cout << person.name << " - Age: " << person.age << "\n";
    }

    std::sort(people.begin(), people.end(),
        [](const Person& a, const Person& b) {
            return a.age < b.age;
        });

    std::cout << "\nSorted by age:\n";
    for (const auto& person : people) {
        std::cout << person.name << " - Age: " << person.age << "\n";
    }

    auto adult_count = std::count_if(people.begin(), people.end(),
        [](const Person& p) { return p.age >= 30; });

    std::cout << "\nPeople aged 30 or older: " << adult_count << "\n";

    return 0;
}
