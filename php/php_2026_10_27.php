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
            throw new InvalidArgumentException('Division by zero is not allowed');
        }
        return $a / $b;
    }
}

function processCalculation(string $operation, float $x, float $y): float {
    $calculator = new Calculator();

    return match($operation) {
        'add' => $calculator->add($x, $y),
        'subtract' => $calculator->subtract($x, $y),
        'multiply' => $calculator->multiply($x, $y),
        'divide' => $calculator->divide($x, $y),
        default => throw new InvalidArgumentException("Unknown operation: $operation")
    };
}

try {
    $result = processCalculation('multiply', 15, 3);
    echo "Result: $result\n";

    $result = processCalculation('divide', 100, 4);
    echo "Result: $result\n";

    $result = processCalculation('add', 50, 25);
    echo "Result: $result\n";
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
