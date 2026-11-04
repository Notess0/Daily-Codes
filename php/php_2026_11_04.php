<?php

class TaskManager {
    private array $tasks = [];
    private int $nextId = 1;

    public function addTask(string $title, string $description = ""): void {
        $task = [
            'id' => $this->nextId++,
            'title' => $title,
            'description' => $description,
            'completed' => false,
            'created_at' => date('Y-m-d H:i:s')
        ];
        $this->tasks[] = $task;
        echo "Task added: {$title}\n";
    }

    public function completeTask(int $id): void {
        foreach ($this->tasks as &$task) {
            if ($task['id'] === $id) {
                $task['completed'] = true;
                echo "Task {$id} marked as completed\n";
                return;
            }
        }
        echo "Task {$id} not found\n";
    }

    public function listTasks(): void {
        if (empty($this->tasks)) {
            echo "No tasks found\n";
            return;
        }

        echo "\n=== Task List ===\n";
        foreach ($this->tasks as $task) {
            $status = $task['completed'] ? '✓' : '○';
            echo "[{$status}] ID: {$task['id']} | {$task['title']}\n";
            if (!empty($task['description'])) {
                echo "    {$task['description']}\n";
            }
        }
        echo "\n";
    }

    public function removeTask(int $id): void {
        $this->tasks = array_filter($this->tasks, fn($task) => $task['id'] !== $id);
        echo "Task {$id} removed\n";
    }
}

$manager = new TaskManager();
$manager->addTask("Learn PHP 8", "Study new features");
$manager->addTask("Build a project");
$manager->completeTask(1);
$manager->listTasks();
$manager->removeTask(2);
$manager->listTasks();
