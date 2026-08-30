#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

int main() {
    std::vector<std::string> tasks;
    std::string command;
    
    std::cout << "Simple Task Manager\n";
    std::cout << "Commands: add, list, remove, clear, quit\n\n";
    
    while (true) {
        std::cout << "> ";
        std::getline(std::cin, command);
        
        if (command == "add") {
            std::cout << "Enter task: ";
            std::string task;
            std::getline(std::cin, task);
            tasks.push_back(task);
            std::cout << "Task added!\n\n";
        }
        else if (command == "list") {
            if (tasks.empty()) {
                std::cout << "No tasks.\n\n";
            } else {
                std::cout << "Tasks:\n";
                for (size_t i = 0; i < tasks.size(); ++i) {
                    std::cout << i + 1 << ". " << tasks[i] << "\n";
                }
                std::cout << "\n";
            }
        }
        else if (command == "remove") {
            std::cout << "Enter task number: ";
            size_t index;
            std::cin >> index;
            std::cin.ignore();
            
            if (index > 0 && index <= tasks.size()) {
                tasks.erase(tasks.begin() + index - 1);
                std::cout << "Task removed!\n\n";
            } else {
                std::cout << "Invalid index.\n\n";
            }
        }
        else if (command == "clear") {
            tasks.clear();
            std::cout << "All tasks cleared!\n\n";
        }
        else if (command == "quit") {
            std::cout << "Goodbye!\n";
            break;
        }
        else {
            std::cout << "Unknown command.\n\n";
        }
    }
    
    return 0;
}
