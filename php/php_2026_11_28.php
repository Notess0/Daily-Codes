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
        if ($b === 0.0) {
            throw new InvalidArgumentException('Division by zero is not allowed');
        }
        return $a / $b;
    }
}

function processNumbers(array $numbers, string $operation): float {
    if (empty($numbers)) {
        throw new InvalidArgumentException('Numbers array cannot be empty');
    }

    $calculator = new Calculator();
    $result = array_shift($numbers);

    foreach ($numbers as $number) {
        $result = match($operation) {
            'add' => $calculator->add($result, $number),
            'subtract' => $calculator->subtract($result, $number),
            'multiply' => $calculator->multiply($result, $number),
            'divide' => $calculator->divide($result, $number),
            default => throw new InvalidArgumentException('Unknown operation: ' . $operation),
        };
    }

    return $result;
}

try {
    echo "Add: " . processNumbers([10, 5, 3], 'add') . PHP_EOL;
    echo "Subtract: " . processNumbers([20, 5, 2], 'subtract') . PHP_EOL;
    echo "Multiply: " . processNumbers([4, 5, 2], 'multiply') . PHP_EOL;
    echo "Divide: " . processNumbers([100, 2, 5], 'divide') . PHP_EOL;
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . PHP_EOL;
}
