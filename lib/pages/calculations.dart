// ignore_for_file: camel_case_types

import 'package:energy_monitoring_app/main.dart';
import 'package:flutter/material.dart';

class calculationPage extends StatefulWidget {
  const calculationPage({super.key});

  @override
  State<calculationPage> createState() => _calculationPageState();
}

class _calculationPageState extends State<calculationPage> {
  //parameters initialization
  final double voltage=220.0;//dummy vallue in volts
  final double current=5.0;//dummy vakue in amperes
  double power=0.0;//power initially zero in watts
  double cost=0.0;//Estimmated cost
  bool isCalculated=false;

  //Cost Calculation
  final double costPerUnit=7.0;//cost per unit in rupees
  final int hoursPerDay = 24; // Assuming usage for 24 hours a day
  final int daysInMonth = 30; // Assuming a month has 30 days

  void calculate()
  {
    //calculate power and cost
    power=voltage*current;//power in watts
    double units=(power/1000)*hoursPerDay*daysInMonth;//converting watt into units
    cost=units*costPerUnit;//Calculate cost
    isCalculated=true;
    setState(() {
      
    });//ui updation

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title:const Center(child:Text("Energy consumption and \nCost Estimation"),),
        ),

        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                child: Text("Calculation of Your energy \nconsumption and cost \n             estimation",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: calculate,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[800], // Background color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0), // Rounded corners
              ),
              padding: const EdgeInsets.all(15.0), // Padding inside the button
            ),
            child: const Text(
              'Calculate',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),


            const SizedBox(height: 20,),
            //Display results
            if(isCalculated)...[
            Text("Voltage💡💡: $voltage V ", style: const TextStyle(fontSize: 24,)),
            const SizedBox(height: 20,),
            Text("Current⚡⚡: $current A ", style:const TextStyle(fontSize: 24)),
            const SizedBox(height: 20,),
            Text("Power Consumption🔌🔌: $power W ", style:const TextStyle(fontSize: 24)),
            const SizedBox(height: 20,),
            Text("Estimated Cost: ₹${cost.toStringAsFixed(2)}", style: const TextStyle(fontSize: 24)),
            ]
          ],
        ),
    );
  }
}
