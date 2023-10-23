import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:thiran_technologies/model/items_model.dart';

class ViewScreen extends StatefulWidget {
  Item detailsView;
  ViewScreen({super.key, required this.detailsView});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  final List<FlSpot> _project_overview = [
    const FlSpot(0, 20.0),
    const FlSpot(1, 20.0),
    const FlSpot(2, 30.0),
    const FlSpot(3, 10.0),
    const FlSpot(4, 40.0),
    const FlSpot(5, 60.0),
    const FlSpot(6, 40.0),
    const FlSpot(7, 80.0),
    const FlSpot(8, 60.0),
    const FlSpot(9, 70.0),
    const FlSpot(10, 50.0),
    const FlSpot(11, 150.0),
    const FlSpot(12, 70.0),
    const FlSpot(13, 80.0),
    const FlSpot(14, 60.0),
    const FlSpot(15, 70.0),
    const FlSpot(16, 60.0),
    const FlSpot(17, 80.0),
    const FlSpot(18, 110.0),
    const FlSpot(19, 130.0),
    const FlSpot(20, 100.0),
    const FlSpot(21, 130.0),
    const FlSpot(22, 160.0),
    const FlSpot(23, 190.0),
    const FlSpot(24, 150.0),
    const FlSpot(25, 170.0),
    const FlSpot(26, 180.0),
    const FlSpot(27, 140.0),
    const FlSpot(28, 150.0),
    const FlSpot(29, 150.0),
    const FlSpot(30, 130.0)
  ];

  final List<FlSpot> _monthlySpots = [
    const FlSpot(0, 110.0),
    const FlSpot(1, 110.0),
    const FlSpot(2, 130.0),
    const FlSpot(3, 100.0),
    const FlSpot(4, 130.0),
    const FlSpot(5, 160.0),
    const FlSpot(6, 190.0),
    const FlSpot(7, 150.0),
    const FlSpot(8, 170.0),
    const FlSpot(9, 180.0),
    const FlSpot(10, 140.0),
    const FlSpot(11, 150.0),
  ];
  final int _currentIndex = 0;
  bool isChecked = true;
  @override
  Widget build(BuildContext context) {
    List randomImages = [
      'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
      'https://lh3.googleusercontent.com/a/ACg8ocJQuNqV0mNabUrHCht2Ys6Wdz3p5OBZ6XIrizvScIveufBP=s360-c-no',
      'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
      'https://lh3.googleusercontent.com/a/ACg8ocJQuNqV0mNabUrHCht2Ys6Wdz3p5OBZ6XIrizvScIveufBP=s360-c-no'
    ];
    return Scaffold(
      appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.more_vert,
                size: 32,
              ),
            )
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.detailsView.name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                child: Text(
                  widget.detailsView.description.toString(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 50.0,
                      lineWidth: 8.0,
                      percent: 0.8,
                      center: const Text("80%"),
                      progressColor: Colors.green,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Team',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Stack(
                            children: [
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    for (int i = 0;
                                        i < randomImages.length;
                                        i++)
                                      Align(
                                        widthFactor: 0.5,
                                        child: CircleAvatar(
                                          radius: 15,
                                          backgroundImage:
                                              NetworkImage(randomImages[i]),
                                        ),
                                      ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios,
                                      size: 18,
                                    )
                                  ],
                                ),
                              ),
                              const Positioned(
                                right: 5,
                                child: CircleAvatar(
                                  radius: 18,
                                  child: Icon(Icons.add),
                                ),
                              )
                            ],
                          ),
                        ),
                        const Text(
                          'Deadline',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 18.0),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month),
                              Text(
                                '  july 25,2021 - july 30,2021',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'Project Progress',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Create user flow',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Create Wire Frame',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      const Text(
                        'Transform for visual design',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      'Project Overview',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          'Weekly',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black54),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.black54)
                    ],
                  ),
                ],
              ),
              Container(
                  height: 200,
                  child: LineChart(
                    mainData(),
                    swapAnimationCurve: Curves.easeInOutCubic,
                    swapAnimationDuration: const Duration(milliseconds: 1000),
                  )),
              Image.asset('images/Frame 117.png'),
            ],
          ),
        ),
      ),
    );
  }

  List<Color> gradientColors = [
    const Color(0xff4FBD8A),
    const Color(0xff4FBD8A),
  ];

  LineChartData mainData() {
    return LineChartData(
      clipData: FlClipData.all(),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
          show: false, horizontalInterval: 1.6, drawVerticalLine: false),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: false,
          reservedSize: 22,
          interval: 3,
          getTextStyles: (context, value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return 'JAN';
              case 2:
                return 'FEB';
              case 3:
                return 'MAR';
              case 4:
                return 'APR';
              case 5:
                return 'MAY';
              case 6:
                return 'JUN';
              case 7:
                return 'JUL';
              case 8:
                return 'AUG';
              case 9:
                return 'SEP';
              case 10:
                return 'OCT';
              case 11:
                return 'NOV';
              case 12:
                return 'DEC';
            }
            return '';
          },
          margin: 20,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          interval: 1,
          getTextStyles: (context, value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
        ),
      ),
      minX: 0,
      maxX: _currentIndex == 0
          ? _project_overview.length - 1.toDouble()
          : _currentIndex == 1
              ? _monthlySpots.length - 1.toDouble()
              : _currentIndex == 2
                  ? _project_overview.length - 20.toDouble()
                  : _project_overview.length.toDouble(),
      minY: 0,
      maxY: 200,
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 2,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(8),
          tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round()}.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _currentIndex == 0
              ? _project_overview
              : _currentIndex == 1
                  ? _monthlySpots
                  : _project_overview,
          isCurved: true,
          colors: gradientColors,
          barWidth: 2,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
              show: true,
              gradientFrom: const Offset(0, 0),
              gradientTo: const Offset(0, 1),
              colors: [
                const Color(0xff279646).withOpacity(0.1),
                const Color(0xff279646).withOpacity(0),
              ]),
        )
      ],
    );
  }
}
