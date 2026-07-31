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
            throw new InvalidArgumentException('Division by zero not allowed');
        }
        return $a / $b;
    }
}

function displayResult(string $operation, float $result): void {
    echo "Result of $operation: $result" . PHP_EOL;
}

try {
    $calc = new Calculator();
    
    $num1 = 15.5;
    $num2 = 3.2;
    
    displayResult('addition (15.5 + 3.2)', $calc->add($num1, $num2));
    displayResult('subtraction (15.5 - 3.2)', $calc->subtract($num1, $num2));
    displayResult('multiplication (15.5 * 3.2)', $calc->multiply($num1, $num2));
    displayResult('division (15.5 / 3.2)', $calc->divide($num1, $num2));
    
} catch (InvalidArgumentException $e) {
    echo 'Error: ' . $e->getMessage() . PHP_EOL;
}
