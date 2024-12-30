import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final List<Map<String, dynamic>> allMonthlyData = [
    {"month": "January", "power": 3300.0, "cost": 693.0},
    {"month": "February", "power": 2800.0, "cost": 588.0},
    {"month": "March", "power": 3500.0, "cost": 735.0},
    {"month": "April", "power": 3000.0, "cost": 630.0},
    {"month": "May", "power": 3200.0, "cost": 672.0},
    {"month": "June", "power": 3100.0, "cost": 651.0},
    {"month": "July", "power": 3400.0, "cost": 714.0},
    {"month": "August", "power": 2900.0, "cost": 609.0},
    {"month": "September", "power": 3600.0, "cost": 756.0},
    {"month": "October", "power": 3700.0, "cost": 777.0},
    {"month": "November", "power": 2800.0, "cost": 588.0},
    {"month": "December", "power": 4000.0, "cost": 840.0},
  ];

  List<Map<String, dynamic>> filteredData = [];
  bool showGraph = false; // Toggle for displaying the graph

  @override
  void initState() {
    super.initState();
    filteredData = allMonthlyData; // Initially show all data
  }

  // Function to filter data based on the selected number of months
  void filterData(int months) {
    setState(() {
      filteredData = allMonthlyData.take(months).toList();
    });
  }

  // Show filter dialog
  void showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Filter History"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select the number of months to display:"),
              const SizedBox(height: 10),
              ...[2, 4, 6, 12].map((months) {
                return ListTile(
                  title: Text("$months Months"),
                  onTap: () {
                    filterData(months);
                    Navigator.pop(context); // Close the dialog
                  },
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  // Function to generate the bar chart data
  List<BarChartGroupData> generateBarChartData() {
    return filteredData
        .asMap()
        .entries
        .map((e) => BarChartGroupData(
              x: e.key,
              barRods: [
                BarChartRodData(
                  toY: e.value['cost'],
                  color: Colors.blue,
                  width: 24, // Wider bars to make them more visible
                  borderRadius: BorderRadius.zero, // Sharp edges for a clean look
                ),
              ],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('History Page'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: showFilterDialog, // Open filter dialog
          ),
        ],
      ),
      body: Column(
        children: [
          // Toggle between table and graph
          SwitchListTile(
            title: const Text("Show Graph"),
            value: showGraph,
            onChanged: (value) {
              setState(() {
                showGraph = value;
              });
            },
          ),
          // If showGraph is true, display the graph, otherwise show the table
          showGraph
              ? Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AspectRatio(
                      aspectRatio: 1.5, // Adjust aspect ratio for smaller graph
                      child: BarChart(
                        BarChartData(
                          gridData: FlGridData(
                            show: true,
                            getDrawingHorizontalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                            getDrawingVerticalLine: (value) {
                              return FlLine(
                                color: const Color(0xff37434d),
                                strokeWidth: 1,
                              );
                            },
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                getTitlesWidget: (value, meta) {
                                  // Display abbreviated month names
                                  final monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0), // Added more padding to move the labels above
                                    child: Text(
                                      monthNames[value.toInt()],
                                      style: TextStyle(fontSize: 14), // Adjust font size
                                    ),
                                  );
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 32,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    '₹${value.toInt()}', // Show cost in ₹
                                    style: TextStyle(fontSize: 12), // Adjust font size
                                  );
                                },
                              ),
                            ),
                          ),
                          borderData: FlBorderData(show: true),
                          barGroups: generateBarChartData(),
                        ),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      final data = filteredData[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                        ),
                        elevation: 5, // Slight shadow for the card
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16.0),
                          tileColor: Colors.blue.shade50, // Light background color
                          title: Text(
                            "${data['month']}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text(
                                "Power Consumption: ${data['power']} W",
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                              Text(
                                "Estimated Cost: ₹${data['cost'].toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 16, color: Colors.black87),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
