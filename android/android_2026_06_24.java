package com.example.calculator;

public class Calculator {
    private double result;
    private double previousValue;
    private String operation;
    private boolean newNumber;

    public Calculator() {
        this.result = 0;
        this.previousValue = 0;
        this.operation = "";
        this.newNumber = true;
    }

    public void inputNumber(int number) {
        if (newNumber) {
            result = number;
            newNumber = false;
        } else {
            result = result * 10 + number;
        }
    }

    public void setOperation(String op) {
        if (!operation.isEmpty()) {
            calculate();
        }
        previousValue = result;
        operation = op;
        newNumber = true;
    }

    public void calculate() {
        if (operation.isEmpty()) {
            return;
        }

        double tempResult = result;
        switch (operation) {
            case "+":
                result = previousValue + result;
                break;
            case "-":
                result = previousValue - result;
                break;
            case "*":
                result = previousValue * result;
                break;
            case "/":
                if (result != 0) {
                    result = previousValue / result;
                }
                break;
        }
        operation = "";
        newNumber = true;
    }

    public double getResult() {
        return result;
    }

    public void clear() {
        result = 0;
        previousValue = 0;
        operation = "";
        newNumber = true;
    }
}
