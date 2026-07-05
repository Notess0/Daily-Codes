#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

class Student {
public:
    std::string name;
    int age;
    double gpa;
    
    Student(std::string n, int a, double g) 
        : name(n), age(a), gpa(g) {}
};

int main() {
    std::vector<Student> students = {
        Student("Alice", 20, 3.8),
        Student("Bob", 19, 3.5),
        Student("Charlie", 21, 3.9),
        Student("Diana", 20, 3.6)
    };
    
    std::cout << "Students before sorting by GPA:\n";
    for (const auto& s : students) {
        std::cout << s.name << " (Age: " << s.age 
                  << ", GPA: " << s.gpa << ")\n";
    }
    
    std::sort(students.begin(), students.end(),
        [](const Student& a, const Student& b) {
            return a.gpa > b.gpa;
        });
    
    std::cout << "\nStudents after sorting by GPA (highest first):\n";
    for (const auto& s : students) {
        std::cout << s.name << " (Age: " << s.age 
                  << ", GPA: " << s.gpa << ")\n";
    }
    
    double avgGpa = 0;
    for (const auto& s : students) {
        avgGpa += s.gpa;
    }
    avgGpa /= students.size();
    
    std::cout << "\nAverage GPA: " << avgGpa << "\n";
    
    return 0;
}
