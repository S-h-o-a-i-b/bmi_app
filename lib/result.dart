import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    // Receive the BMI value from the previous page
    String bmiValue = Get.arguments ?? "0.0";
    double bmi = double.tryParse(bmiValue) ?? 0.0;

    // Determine BMI classification and color
    String getClassification(double bmi) {
      if (bmi < 18.5) return "Under Weight";
      if (bmi < 25) return "Normal";
      if (bmi < 30) return "Excess Weight";
      if (bmi < 35) return "Obesity";
      return "Extremely Obesity";
    }

    Color getColor(double bmi) {
      if (bmi < 18.5) return Colors.teal; // Under Weight
      if (bmi < 25) return Colors.green; // Normal
      if (bmi < 30) return Colors.orangeAccent; // Excess Weight
      if (bmi < 35) return Colors.redAccent; // Obesity
      return Colors.red; // Extremely Obesity
    }

    String classification = getClassification(bmi);
    Color categoryColor = getColor(bmi);

    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Result"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bmi4.png", height: 350, width: 350),
            const SizedBox(height: 20),

            // BMI Value
            Text(
              "BMI = $bmiValue kg/m²",
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),

            // BMI Classification
            Text(
              classification,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: categoryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
