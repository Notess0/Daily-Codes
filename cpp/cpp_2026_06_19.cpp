#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
};

bool compareByAge(const Person& a, const Person& b) {
    return a.age < b.age;
}

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

    std::sort(people.begin(), people.end(), compareByAge);

    std::cout << "\nSorted by age:\n";
    for (const auto& person : people) {
        std::cout << person.name << " - Age: " << person.age << "\n";
    }

    auto adult = std::find_if(people.begin(), people.end(),
        [](const Person& p) { return p.age >= 30; });

    if (adult != people.end()) {
        std::cout << "\nFirst person aged 30 or older: " << adult->name << "\n";
    }

    return 0;
}
