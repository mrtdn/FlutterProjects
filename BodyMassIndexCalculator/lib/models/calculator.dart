class Calculator {
  double bmi;

  Calculator(weight, height) {
    this.bmi = (weight / (height / 100 * height / 100));
  }

  fetchBMI() {
    return bmi.toStringAsFixed(1);
  }

  fetchResultText() {
    if (bmi < 18.5) return 'Below Normal Weight';
    if (bmi >= 18.5 && bmi < 25) return 'Normal Weight';
    if (bmi >= 25 && bmi < 40.0) return 'Overweight';
    if (bmi >= 40) return 'Obese';
  }
}
