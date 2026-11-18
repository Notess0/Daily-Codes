#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
    
    Person(const std::string& n, int a) : name(n), age(a) {}
};

int main() {
    std::vector<Person> people = {
        Person("Alice", 28),
        Person("Bob", 35),
        Person("Charlie", 22),
        Person("Diana", 31)
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
    
    auto adults = std::count_if(people.begin(), people.end(),
        [](const Person& p) { return p.age >= 18; });
    
    std::cout << "\nNumber of adults (18+): " << adults << "\n";
    
    return 0;
}
