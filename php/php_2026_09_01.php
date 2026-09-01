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
            throw new InvalidArgumentException("Division by zero not allowed");
        }
        return $a / $b;
    }
}

function processCalculation(string $operation, float $x, float $y): void {
    $calc = new Calculator();
    
    try {
        $result = match($operation) {
            'add' => $calc->add($x, $y),
            'subtract' => $calc->subtract($x, $y),
            'multiply' => $calc->multiply($x, $y),
            'divide' => $calc->divide($x, $y),
            default => throw new InvalidArgumentException("Unknown operation: $operation")
        };
        
        echo "Result: $result\n";
    } catch (InvalidArgumentException $e) {
        echo "Error: {$e->getMessage()}\n";
    }
}

processCalculation('add', 10, 5);
processCalculation('subtract', 20, 8);
processCalculation('multiply', 4, 7);
processCalculation('divide', 15, 3);
processCalculation('divide', 10, 0);
