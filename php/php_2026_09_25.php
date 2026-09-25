<?php

declare(strict_types=1);

class Calculator {
    private float $result = 0;
    
    public function add(float $num): self {
        $this->result += $num;
        return $this;
    }
    
    public function subtract(float $num): self {
        $this->result -= $num;
        return $this;
    }
    
    public function multiply(float $num): self {
        $this->result *= $num;
        return $this;
    }
    
    public function divide(float $num): self {
        if ($num === 0.0) {
            throw new InvalidArgumentException('Division by zero');
        }
        $this->result /= $num;
        return $this;
    }
    
    public function reset(): self {
        $this->result = 0;
        return $this;
    }
    
    public function getResult(): float {
        return $this->result;
    }
}

$calc = new Calculator();

$result = $calc
    ->add(10)
    ->multiply(5)
    ->subtract(15)
    ->divide(5)
    ->getResult();

echo "Result: " . $result . PHP_EOL;

$calc->reset();
echo "After reset: " . $calc->getResult() . PHP_EOL;
