#include <iostream>
#include <vector>
#include <algorithm>
#include <string>

class Task {
private:
    std::string description;
    bool completed;

public:
    Task(const std::string& desc) : description(desc), completed(false) {}

    void markComplete() { completed = true; }
    void markIncomplete() { completed = false; }
    bool isCompleted() const { return completed; }
    const std::string& getDescription() const { return description; }

    void display() const {
        std::cout << "[" << (completed ? "X" : " ") << "] " << description << "\n";
    }
};

int main() {
    std::vector<Task> tasks;
    int choice;

    while (true) {
        std::cout << "\n1. Add task\n2. Complete task\n3. Show tasks\n4. Exit\nChoice: ";
        std::cin >> choice;
        std::cin.ignore();

        if (choice == 1) {
            std::string task;
            std::cout << "Enter task description: ";
            std::getline(std::cin, task);
            tasks.emplace_back(task);
        }
        else if (choice == 2) {
            int index;
            std::cout << "Task number to complete: ";
            std::cin >> index;
            if (index > 0 && index <= static_cast<int>(tasks.size())) {
                tasks[index - 1].markComplete();
            }
        }
        else if (choice == 3) {
            std::cout << "\nTasks:\n";
            for (size_t i = 0; i < tasks.size(); ++i) {
                std::cout << (i + 1) << ". ";
                tasks[i].display();
            }
        }
        else if (choice == 4) {
            break;
        }
    }

    return 0;
}
