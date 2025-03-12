import 'package:daily_expense_management/page/dashboard_page/BottomPart.dart';
import 'package:daily_expense_management/res/colors/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    bool isExpenseStatus = true;
    return Scaffold(
      backgroundColor: const Color(MyColors.primaryColor),
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dashboard title
                  const Center(
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Budget details
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "VND",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "150.000.000",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(MyColors.secondaryColor),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "+8%",
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Out of VND 40,000 budgeting",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Add Money Button + Stock Chart
                  Row(
                    children: [
                      // Add Money Button
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 44,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(MyColors.secondaryColor),
                              foregroundColor: const Color(MyColors.blackColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "+ Add Money",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Stock Chart
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: 100, // Adjust the width
                          height: 50,
                          child: LineChart(
                            LineChartData(
                              gridData: const FlGridData(show: false),
                              titlesData: const FlTitlesData(show: false),
                              borderData: FlBorderData(
                                show: false,
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: [
                                    const FlSpot(0, 3),
                                    const FlSpot(1, 3.5),
                                    const FlSpot(2, 4),
                                    const FlSpot(3, 3.8),
                                    const FlSpot(4, 5),
                                    const FlSpot(5, 4.8),
                                    const FlSpot(6, 5.5),
                                  ],
                                  isCurved: true,
                                  color: Colors.greenAccent,
                                  barWidth: 2,
                                  dotData: const FlDotData(show: false),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // White Container (Bottom Part)
            BottomPartWidget(),
          ],
        ),
      ),
    );
  }
}
