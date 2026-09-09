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
            throw new InvalidArgumentException("Division by zero is not allowed");
        }
        return $a / $b;
    }
}

function processCalculation(string $operation, float $num1, float $num2): float {
    $calculator = new Calculator();

    return match($operation) {
        'add' => $calculator->add($num1, $num2),
        'subtract' => $calculator->subtract($num1, $num2),
        'multiply' => $calculator->multiply($num1, $num2),
        'divide' => $calculator->divide($num1, $num2),
        default => throw new InvalidArgumentException("Unknown operation: $operation")
    };
}

try {
    $result1 = processCalculation('add', 15, 25);
    echo "15 + 25 = $result1\n";

    $result2 = processCalculation('multiply', 6, 7);
    echo "6 * 7 = $result2\n";

    $result3 = processCalculation('divide', 100, 4);
    echo "100 / 4 = $result3\n";
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
