<?php

declare(strict_types=1);

class Calculator {
    private float $result = 0;
    
    public function add(float $number): self {
        $this->result += $number;
        return $this;
    }
    
    public function subtract(float $number): self {
        $this->result -= $number;
        return $this;
    }
    
    public function multiply(float $number): self {
        $this->result *= $number;
        return $this;
    }
    
    public function divide(float $number): self {
        if ($number === 0) {
            throw new InvalidArgumentException('Division by zero is not allowed');
        }
        $this->result /= $number;
        return $this;
    }
    
    public function getResult(): float {
        return $this->result;
    }
    
    public function reset(): self {
        $this->result = 0;
        return $this;
    }
}

$calc = new Calculator();
$result = $calc->add(10)
    ->multiply(2)
    ->subtract(5)
    ->divide(3)
    ->getResult();

echo "Result: " . number_format($result, 2) . "\n";
echo "After reset: " . $calc->reset()->add(100)->getResult() . "\n";
