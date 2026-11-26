#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
    
    Person(std::string n, int a) : name(n), age(a) {}
    
    void display() const {
        std::cout << "Name: " << name << ", Age: " << age << std::endl;
    }
};

int main() {
    std::vector<Person> people;
    
    people.emplace_back("Alice", 28);
    people.emplace_back("Bob", 35);
    people.emplace_back("Charlie", 22);
    people.emplace_back("Diana", 30);
    
    std::cout << "Original list:" << std::endl;
    for (const auto& person : people) {
        person.display();
    }
    
    std::sort(people.begin(), people.end(), 
              [](const Person& a, const Person& b) {
                  return a.age < b.age;
              });
    
    std::cout << "\nSorted by age:" << std::endl;
    for (const auto& person : people) {
        person.display();
    }
    
    auto adult = std::find_if(people.begin(), people.end(),
                              [](const Person& p) { return p.age >= 30; });
    
    if (adult != people.end()) {
        std::cout << "\nFirst person aged 30+: ";
        adult->display();
    }
    
    return 0;
}
