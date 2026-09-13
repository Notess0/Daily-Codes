void main() {
  final calculator = Calculator();
  
  print('Simple Calculator');
  print('================');
  
  print('Addition: 15 + 8 = ${calculator.add(15, 8)}');
  print('Subtraction: 15 - 8 = ${calculator.subtract(15, 8)}');
  print('Multiplication: 15 * 8 = ${calculator.multiply(15, 8)}');
  print('Division: 15 / 8 = ${calculator.divide(15, 8)}');
  print('Power: 2 ^ 8 = ${calculator.power(2, 8)}');
  
  print('\nTemperature Converter');
  print('=====================');
  final converter = TemperatureConverter();
  print('32°F to Celsius: ${converter.fahrenheitToCelsius(32)}°C');
  print('100°C to Fahrenheit: ${converter.celsiusToFahrenheit(100)}°F');
  
  print('\nList Operations');
  print('===============');
  final numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  print('Numbers: $numbers');
  print('Sum: ${numbers.reduce((a, b) => a + b)}');
  print('Average: ${numbers.reduce((a, b) => a + b) / numbers.length}');
  print('Max: ${numbers.reduce((a, b) => a > b ? a : b)}');
  print('Min: ${numbers.reduce((a, b) => a < b ? a : b)}');
}

class Calculator {
  double add(double a, double b) => a + b;
  double subtract(double a, double b) => a - b;
  double multiply(double a, double b) => a * b;
  double divide(double a, double b) => a / b;
  double power(double a, double b) => a == 0 ? 0 : pow(a, b).toDouble();
  
  double pow(double base, double exp) {
    double result = 1;
    for (int i = 0; i < exp; i++) {
      result *= base;
    }
    return result;
  }
}

class TemperatureConverter {
  double fahrenheitToCelsius(double f) => (f - 32) * 5 / 9;
  double celsiusToFahrenheit(double c) => (c * 9 / 5) + 32;
}
