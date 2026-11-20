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
        if ($b == 0) {
            throw new InvalidArgumentException("Division by zero is not allowed");
        }
        return $a / $b;
    }
}

function main(): void {
    $calc = new Calculator();
    
    echo "Simple Calculator\n";
    echo "================\n\n";
    
    $num1 = 15.5;
    $num2 = 3.2;
    
    echo "Number 1: $num1\n";
    echo "Number 2: $num2\n\n";
    
    echo "Addition: " . $calc->add($num1, $num2) . "\n";
    echo "Subtraction: " . $calc->subtract($num1, $num2) . "\n";
    echo "Multiplication: " . $calc->multiply($num1, $num2) . "\n";
    echo "Division: " . $calc->divide($num1, $num2) . "\n";
    
    try {
        $calc->divide($num1, 0);
    } catch (InvalidArgumentException $e) {
        echo "Error: " . $e->getMessage() . "\n";
    }
}

main();
