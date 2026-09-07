#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Person {
    std::string name;
    int age;
    
    Person(std::string n, int a) : name(n), age(a) {}
};

bool compareByAge(const Person& a, const Person& b) {
    return a.age < b.age;
}

void printPerson(const Person& p) {
    std::cout << p.name << " is " << p.age << " years old\n";
}

int main() {
    std::vector<Person> people;
    
    people.emplace_back("Alice", 30);
    people.emplace_back("Bob", 25);
    people.emplace_back("Charlie", 35);
    people.emplace_back("Diana", 28);
    
    std::cout << "Before sorting:\n";
    std::for_each(people.begin(), people.end(), printPerson);
    
    std::sort(people.begin(), people.end(), compareByAge);
    
    std::cout << "\nAfter sorting by age:\n";
    std::for_each(people.begin(), people.end(), printPerson);
    
    auto adult = std::find_if(people.begin(), people.end(), 
                              [](const Person& p) { return p.age > 30; });
    
    if (adult != people.end()) {
        std::cout << "\nFirst person over 30: " << adult->name << "\n";
    }
    
    return 0;
}
