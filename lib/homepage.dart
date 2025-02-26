import 'package:bmi_app/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => CalculatorScreen()));

            Get.to(BmiScreen());


          },
          label: const Text("Calculate BMI"),
          icon: const Icon(Icons.calculate_outlined),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
      ),
    );
  }
}