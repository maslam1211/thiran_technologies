import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:thiran_technologies/view_screen.dart';

import 'controller/provider/data_provider.dart';
import 'model/items_model.dart';

class AllTab extends StatefulWidget {
  Item? details;

  AllTab({
    super.key,
    this.details,
  });

  @override
  State<AllTab> createState() => _AllTabState();
}

class _AllTabState extends State<AllTab> {
  @override
  Widget build(BuildContext context) {
    List randomImages = [
      'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
      'https://lh3.googleusercontent.com/a/ACg8ocJQuNqV0mNabUrHCht2Ys6Wdz3p5OBZ6XIrizvScIveufBP=s360-c-no',
      'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
      'https://lh3.googleusercontent.com/a/ACg8ocJQuNqV0mNabUrHCht2Ys6Wdz3p5OBZ6XIrizvScIveufBP=s360-c-no'
    ];
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        if (value.dataModel.isEmpty) {
          return const CircularProgressIndicator(); // or any other loading indicator or message
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: value.dataModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewScreen(
                                  detailsView: value.dataModel[index])),
                        );
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.dataModel[index].name,
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          value.dataModel[index].description
                                              .toString(),
                                          style: TextStyle(
                                              overflow: TextOverflow.clip,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54),
                                        ),
                                      ),
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
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                for (int i = 0;
                                                    i < randomImages.length;
                                                    i++)
                                                  Align(
                                                    widthFactor: 0.5,
                                                    child: CircleAvatar(
                                                      radius: 15,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              randomImages[i]),
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
                                  ),
                                  CircularPercentIndicator(
                                    radius: 40.0,
                                    lineWidth: 8.0,
                                    percent: 0.8,
                                    center: const Text("80%"),
                                    progressColor: Colors.green,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
