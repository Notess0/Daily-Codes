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
    bool isCompleted() const { return completed; }
    std::string getDescription() const { return description; }
};

int main() {
    std::vector<Task> tasks;
    int choice = 0;

    while (choice != 4) {
        std::cout << "\n=== Task Manager ===\n";
        std::cout << "1. Add Task\n";
        std::cout << "2. Complete Task\n";
        std::cout << "3. View Tasks\n";
        std::cout << "4. Exit\n";
        std::cout << "Choose: ";
        std::cin >> choice;
        std::cin.ignore();

        if (choice == 1) {
            std::string desc;
            std::cout << "Enter task description: ";
            std::getline(std::cin, desc);
            tasks.emplace_back(desc);
            std::cout << "Task added!\n";
        } else if (choice == 2) {
            std::cout << "Enter task number: ";
            int num;
            std::cin >> num;
            if (num > 0 && num <= (int)tasks.size()) {
                tasks[num - 1].markComplete();
                std::cout << "Task marked complete!\n";
            }
        } else if (choice == 3) {
            for (size_t i = 0; i < tasks.size(); ++i) {
                std::cout << i + 1 << ". " << tasks[i].getDescription();
                std::cout << " [" << (tasks[i].isCompleted() ? "Done" : "Pending") << "]\n";
            }
        }
    }

    std::cout << "Goodbye!\n";
    return 0;
}
