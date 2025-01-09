// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:energy_monitoring_app/Theme/theme_provider.dart';
import 'package:energy_monitoring_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
    if (!isCalculated) {
    calculate(); // Call calculate if not already calculated
  }
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title:const Center(child: Text("Electricity Monitoring",
        style: TextStyle(fontSize: 24),)),
        actions: [
          IconButton(onPressed: (){
            Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
          }, icon: const Icon(Icons.dark_mode)),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
          }, icon: const Icon(Icons.account_circle,size: 34,))
          
        ],
      ),
      
      drawer: Drawer(
  backgroundColor: Theme.of(context).colorScheme.primary,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Change to start
    children: [
      
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ExpansionTile(
          initiallyExpanded: false,
          leading: const Icon(Icons.settings, size: 36,),
          title: Text(
            "Settings",
            style: TextStyle(fontSize: 36, color: Theme.of(context).colorScheme.tertiary),
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                "Enable Notification",
                style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: Text(
                "About Device",
                style: TextStyle(fontSize: 24, color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          ],
        ),
      ),
      const Spacer(), // Add Spacer to push Logout to the bottom
      Padding(
        padding: const EdgeInsets.only(top:16.0),
        child: ListTile(
          leading: const Icon(Icons.logout, size: 36,),
          title: Text(
            "Logout",
            style: TextStyle(fontSize: 36, color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ),
    ],
  ),
),
        body: Column(
          children: [

            const Padding(
              padding: EdgeInsets.all(25.0),
              child: Center(
                
                child: Text("Calculation of Your energy \n consumption and cost \n             estimation",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
          


            const SizedBox(height: 20,),
            //Display results
            if(isCalculated)...[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.transparent,
                          child: Image.asset('lib/images/battery.png'),
                        ),
                        const SizedBox(height: 10),
                        Text("Voltage", style:TextStyle(fontSize: 30,color: Theme.of(context).colorScheme.tertiary)),
                        Text("$voltage V", style:TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.tertiary)),
                      ],
                    ),

                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.transparent,
                          child: Image.asset('lib/images/current.png'),
                        ),
                        const SizedBox(height: 10),
                        Text("Current", style:TextStyle(fontSize: 30,color: Theme.of(context).colorScheme.tertiary)),
                        Text("$current A", style:TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.tertiary)),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 35),
                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.transparent,
                          child: Image.asset('lib/images/power.png'),
                        ),
                        const SizedBox(height: 10),
                        Text("   Power \nConsumed", style:TextStyle(fontSize: 30,color: Theme.of(context).colorScheme.tertiary)),
                        Text("$power W", style:TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.tertiary)),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 150,
                          height: 150,
                          color: Colors.transparent,
                          child: Image.asset('lib/images/rupee.png'),
                        ),
                    const SizedBox(height: 10),
                    Text("   Estimated \n       Cost", style:TextStyle(fontSize: 30,color: Theme.of(context).colorScheme.tertiary)),
                    Text("₹${cost.toStringAsFixed(2)}", style:TextStyle(fontSize: 24,color: Theme.of(context).colorScheme.tertiary)),
                      ],
                    ),
                   
                  ]
                ),

              ],
            )


            ]
          ],
      )
    );
    
  }
}