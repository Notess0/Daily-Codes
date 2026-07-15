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
        if ($num === 0) {
            throw new InvalidArgumentException("Cannot divide by zero");
        }
        $this->result /= $num;
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

try {
    $result = $calc
        ->add(10)
        ->multiply(2)
        ->subtract(5)
        ->divide(3)
        ->getResult();

    echo "Result: " . number_format($result, 2) . PHP_EOL;
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . PHP_EOL;
}
