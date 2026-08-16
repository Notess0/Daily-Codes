<?php

declare(strict_types=1);

class TodoApp {
    private array $todos = [];
    private int $nextId = 1;

    public function addTodo(string $title): void {
        $this->todos[$this->nextId] = [
            'id' => $this->nextId,
            'title' => $title,
            'completed' => false,
            'createdAt' => date('Y-m-d H:i:s')
        ];
        $this->nextId++;
    }

    public function completeTodo(int $id): bool {
        if (isset($this->todos[$id])) {
            $this->todos[$id]['completed'] = true;
            return true;
        }
        return false;
    }

    public function removeTodo(int $id): bool {
        if (isset($this->todos[$id])) {
            unset($this->todos[$id]);
            return true;
        }
        return false;
    }

    public function getTodos(bool $onlyActive = false): array {
        if ($onlyActive) {
            return array_filter($this->todos, fn($todo) => !$todo['completed']);
        }
        return $this->todos;
    }

    public function getStats(): array {
        $total = count($this->todos);
        $completed = count(array_filter($this->todos, fn($todo) => $todo['completed']));
        return [
            'total' => $total,
            'completed' => $completed,
            'remaining' => $total - $completed
        ];
    }
}

$app = new TodoApp();
$app->addTodo('Learn PHP 8');
$app->addTodo('Build a project');
$app->addTodo('Deploy application');

$app->completeTodo(1);

echo json_encode($app->getStats(), JSON_PRETTY_PRINT);
