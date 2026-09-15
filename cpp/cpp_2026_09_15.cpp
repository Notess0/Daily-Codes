#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

struct Student {
    std::string name;
    int age;
    double gpa;
};

void displayStudent(const Student& s) {
    std::cout << "Name: " << s.name 
              << ", Age: " << s.age 
              << ", GPA: " << s.gpa << std::endl;
}

int main() {
    std::vector<Student> students = {
        {"Alice", 20, 3.8},
        {"Bob", 19, 3.5},
        {"Charlie", 21, 3.9},
        {"Diana", 20, 3.7}
    };

    std::cout << "All Students:" << std::endl;
    for (const auto& student : students) {
        displayStudent(student);
    }

    std::cout << "\nStudents sorted by GPA:" << std::endl;
    std::sort(students.begin(), students.end(), 
              [](const Student& a, const Student& b) {
                  return a.gpa > b.gpa;
              });

    for (const auto& student : students) {
        displayStudent(student);
    }

    auto highAchievers = students | 
        std::views::filter([](const Student& s) { return s.gpa >= 3.8; });

    std::cout << "\nHigh Achievers (GPA >= 3.8):" << std::endl;
    for (const auto& student : highAchievers) {
        displayStudent(student);
    }

    return 0;
}
