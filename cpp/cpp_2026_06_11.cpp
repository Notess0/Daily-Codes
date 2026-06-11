#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
    
    Person(std::string n, int a) : name(n), age(a) {}
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
        std::cout << person.name << " - " << person.age << " years\n";
    }
    
    std::sort(people.begin(), people.end(), 
        [](const Person& a, const Person& b) {
            return a.age < b.age;
        });
    
    std::cout << "\nSorted by age:\n";
    for (const auto& person : people) {
        std::cout << person.name << " - " << person.age << " years\n";
    }
    
    auto avg_age = 0.0;
    for (const auto& person : people) {
        avg_age += person.age;
    }
    avg_age /= people.size();
    
    std::cout << "\nAverage age: " << avg_age << " years\n";
    
    auto adults = std::count_if(people.begin(), people.end(),
        [](const Person& p) { return p.age >= 18; });
    
    std::cout << "Number of adults (18+): " << adults << "\n";
    
    return 0;
}
