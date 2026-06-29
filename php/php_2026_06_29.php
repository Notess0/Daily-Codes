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
        if ($b == 0) {
            throw new InvalidArgumentException("Division by zero not allowed");
        }
        return $a / $b;
    }
}

function processCalculation(string $operation, int|float $x, int|float $y): void {
    $calc = new Calculator();
    
    try {
        $result = match($operation) {
            'add' => $calc->add($x, $y),
            'subtract' => $calc->subtract($x, $y),
            'multiply' => $calc->multiply($x, $y),
            'divide' => $calc->divide($x, $y),
            default => throw new ValueError("Unknown operation: $operation")
        };
        
        echo "Result: $result\n";
    } catch (Exception $e) {
        echo "Error: " . $e->getMessage() . "\n";
    }
}

processCalculation('add', 10, 5);
processCalculation('multiply', 4, 7);
processCalculation('divide', 20, 4);
processCalculation('divide', 10, 0);
