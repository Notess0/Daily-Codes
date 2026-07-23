<?php

declare(strict_types=1);

class Calculator {
    private float $result = 0;

    public function add(float $value): self {
        $this->result += $value;
        return $this;
    }

    public function subtract(float $value): self {
        $this->result -= $value;
        return $this;
    }

    public function multiply(float $value): self {
        $this->result *= $value;
        return $this;
    }

    public function divide(float $value): self {
        if ($value === 0) {
            throw new InvalidArgumentException('Division by zero is not allowed');
        }
        $this->result /= $value;
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

try {
    $calc = new Calculator();
    $result = $calc->add(10)
                   ->multiply(5)
                   ->subtract(15)
                   ->divide(5)
                   ->getResult();

    echo "Result: " . $result . PHP_EOL;

    $calc->reset();
    echo "Reset: " . $calc->getResult() . PHP_EOL;
} catch (InvalidArgumentException $e) {
    echo "Error: " . $e->getMessage() . PHP_EOL;
}
