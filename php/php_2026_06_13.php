<?php

declare(strict_types=1);

class Calculator {
    public function add(float $a, float $b): float {
        return $a + $b;
    }

    public function subtract(float $a, float $b): float {
        return $a - $b;
    }

    public function multiply(float $a, float $b): float {
        return $a * $b;
    }

    public function divide(float $a, float $b): float {
        if ($b === 0) {
            throw new InvalidArgumentException('Division by zero');
        }
        return $a / $b;
    }
}

function processInput(string $operation, float $x, float $y): float|string {
    $calc = new Calculator();

    return match($operation) {
        'add' => $calc->add($x, $y),
        'subtract' => $calc->subtract($x, $y),
        'multiply' => $calc->multiply($x, $y),
        'divide' => $calc->divide($x, $y),
        default => 'Invalid operation'
    };
}

$result = processInput('add', 10, 5);
echo "10 + 5 = {$result}\n";

$result = processInput('multiply', 4, 7);
echo "4 * 7 = {$result}\n";

try {
    $result = processInput('divide', 20, 4);
    echo "20 / 4 = {$result}\n";
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage();
}
