<?php

declare(strict_types=1);

class Calculator
{
    public function add(float $a, float $b): float
    {
        return $a + $b;
    }

    public function subtract(float $a, float $b): float
    {
        return $a - $b;
    }

    public function multiply(float $a, float $b): float
    {
        return $a * $b;
    }

    public function divide(float $a, float $b): float
    {
        if ($b === 0.0) {
            throw new InvalidArgumentException('Division by zero is not allowed');
        }
        return $a / $b;
    }
}

$calculator = new Calculator();

try {
    echo "Addition: " . $calculator->add(10, 5) . PHP_EOL;
    echo "Subtraction: " . $calculator->subtract(10, 5) . PHP_EOL;
    echo "Multiplication: " . $calculator->multiply(10, 5) . PHP_EOL;
    echo "Division: " . $calculator->divide(10, 5) . PHP_EOL;
    echo "Division by zero: " . $calculator->divide(10, 0) . PHP_EOL;
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . PHP_EOL;
}
