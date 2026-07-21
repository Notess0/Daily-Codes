#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
    
    Person(const std::string& n, int a) : name(n), age(a) {}
    
    void display() const {
        std::cout << name << " (" << age << " years old)\n";
    }
};

int main() {
    std::vector<Person> people;
    
    people.emplace_back("Alice", 28);
    people.emplace_back("Bob", 35);
    people.emplace_back("Charlie", 22);
    people.emplace_back("Diana", 30);
    
    std::cout << "Original list:\n";
    for (const auto& person : people) {
        person.display();
    }
    
    std::sort(people.begin(), people.end(), 
              [](const Person& a, const Person& b) {
                  return a.age < b.age;
              });
    
    std::cout << "\nSorted by age:\n";
    for (const auto& person : people) {
        person.display();
    }
    
    auto adult_count = std::count_if(people.begin(), people.end(),
                                      [](const Person& p) { return p.age >= 21; });
    
    std::cout << "\nNumber of adults (21+): " << adult_count << "\n";
    
    return 0;
}
