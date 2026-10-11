<?php

declare(strict_types=1);

class TaskManager {
    private array $tasks = [];
    
    public function addTask(string $title, string $description = ''): void {
        $task = [
            'id' => count($this->tasks) + 1,
            'title' => $title,
            'description' => $description,
            'completed' => false,
            'created_at' => date('Y-m-d H:i:s')
        ];
        $this->tasks[] = $task;
    }
    
    public function completeTask(int $id): bool {
        foreach ($this->tasks as &$task) {
            if ($task['id'] === $id) {
                $task['completed'] = true;
                return true;
            }
        }
        return false;
    }
    
    public function getTasks(bool $onlyPending = false): array {
        if ($onlyPending) {
            return array_filter($this->tasks, fn($task) => !$task['completed']);
        }
        return $this->tasks;
    }
    
    public function removeTask(int $id): bool {
        $this->tasks = array_filter($this->tasks, fn($task) => $task['id'] !== $id);
        return true;
    }
}

$manager = new TaskManager();
$manager->addTask('Learn PHP 8', 'Study new PHP 8 features');
$manager->addTask('Build project', 'Create a new web application');
$manager->addTask('Write tests', 'Add unit tests to project');

$manager->completeTask(1);

echo "All Tasks:\n";
foreach ($manager->getTasks() as $task) {
    $status = $task['completed'] ? '✓' : '○';
    echo "$status {$task['title']}\n";
}

echo "\nPending Tasks:\n";
foreach ($manager->getTasks(onlyPending: true) as $task) {
    echo "- {$task['title']}\n";
}
