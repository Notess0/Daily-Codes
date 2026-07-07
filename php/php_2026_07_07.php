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
            throw new InvalidArgumentException("Cannot divide by zero");
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

try {
    $answer = $calc
        ->add(10)
        ->multiply(5)
        ->subtract(15)
        ->divide(7)
        ->getResult();

    echo "Result: " . round($answer, 2) . "\n";

} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
