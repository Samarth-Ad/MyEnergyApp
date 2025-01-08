import 'package:electricity_app_home/pages/calculations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Center(child: Text("Electricity Monitoring",
        style: TextStyle(fontSize: 24),)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.account_circle,size: 34,))
        ],
      ),
      floatingActionButton: SizedBox(
        height: 100,width: 100,
        child: FloatingActionButton(onPressed:() {
          Navigator.push(context,
    MaterialPageRoute(builder: (context) => calculationPage()));
        },
        tooltip: "Go to Electricity Calculations Page",
        backgroundColor: Colors.orange[400],
        child: Icon(Icons.bolt_outlined,size: 50,),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        backgroundColor: Colors.orange[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            
            Container(
              color: Colors.orange[300],
              child: Row(
                
                children: [
                  
                  Icon(Icons.settings,size: 32,),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Settings",
                                    style: TextStyle(
                    fontSize: 32,
                                    ),),
                  ),
                ]   
              ),
            ),
            const SizedBox(height: 700,),
            Container(
              color: Colors.orange[300],
              child: Row(
                
                children: [
                  Icon(Icons.logout,size: 32,),
                  const SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Logout",
                                    style: TextStyle(
                    fontSize: 32,
                                    ),),
                  ),
                ]   
              ),
            )
          ],
          
        ),
      ),
    );
  }
}