import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import the new page

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  // Declare Controllers
  final firstController = TextEditingController();
  final secondController = TextEditingController();

  var result = "0".obs;

  void calculateBmi(String weight, String height) {
    double w = double.parse(weight);
    double h = double.parse(height) / 100; // Convert cm to meters
    double bmi = w / (h * h);

    result.value = bmi.toStringAsFixed(1);

    // Navigate to ResultPage and pass BMI value
    Get.to(Result(), arguments: result.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/bmi.png", height: 200, width: 200),
            const SizedBox(height: 20),

            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Weight (kg)",
                prefixIcon: Icon(Icons.monitor_weight),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Height (cm)",
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                String weight = firstController.text;
                String height = secondController.text;

                if (weight.isNotEmpty && height.isNotEmpty) {
                  calculateBmi(weight, height);
                } else {
                  Get.snackbar("Error", "Please enter valid values.");
                }
              },
              label: const Text("Calculate BMI"),
              icon: const Icon(Icons.calculate),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
