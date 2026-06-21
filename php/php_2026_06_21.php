<?php

declare(strict_types=1);

class Calculator {
    public function add(int|float $a, int|float $b): int|float {
        return $a + $b;
    }

    public function subtract(int|float $a, int|float $b): int|float {
        return $a - $b;
    }

    public function multiply(int|float $a, int|float $b): int|float {
        return $a * $b;
    }

    public function divide(int|float $a, int|float $b): int|float {
        if ($b === 0) {
            throw new InvalidArgumentException('Division by zero');
        }
        return $a / $b;
    }
}

function main(): void {
    $calc = new Calculator();

    $num1 = 20;
    $num2 = 5;

    echo "Addition: " . $calc->add($num1, $num2) . "\n";
    echo "Subtraction: " . $calc->subtract($num1, $num2) . "\n";
    echo "Multiplication: " . $calc->multiply($num1, $num2) . "\n";
    echo "Division: " . $calc->divide($num1, $num2) . "\n";

    try {
        echo "Division by zero: " . $calc->divide($num1, 0) . "\n";
    } catch (InvalidArgumentException $e) {
        echo "Error: " . $e->getMessage() . "\n";
    }
}

main();
