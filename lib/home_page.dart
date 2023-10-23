import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:thiran_technologies/controller/provider/data_provider.dart';
import 'package:thiran_technologies/dashboard_screen.dart';

List colors = [Colors.red, Colors.yellow, Colors.blue, Colors.green];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<DataProvider>(context, listen: false).getData();
  }

  final List _names = [
    {'name': 'In Progress', 'icon': Icons.access_time_sharp},
    {'name': 'Ongoing', 'icon': Icons.time_to_leave},
    {'name': 'Completed', 'icon': Icons.done},
    {'name': 'Cancel', 'icon': Icons.close},
  ];
  List randomImages = [
    'https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://lh3.googleusercontent.com/a/ACg8ocJQuNqV0mNabUrHCht2Ys6Wdz3p5OBZ6XIrizvScIveufBP=s360-c-no'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Consumer<DataProvider>(
              builder: (context, value, child) {
                if (value.dataModel.isEmpty) {
                  return const CircularProgressIndicator(); // or any other loading indicator or message
                }
// print('value.dataModel ${value.dataModel[0].items}');
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.network(
                                value.dataModel[0].owner.avatarUrl),
                          ),
                        ),
                        const Icon(
                          Icons.search,
                          size: 30,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "Hello",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        value.dataModel.first.fullName ?? "",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 270,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: _names.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: colors[index],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(_names[index]['icon']),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    _names[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Daily Task',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Row(
                          children: [
                            Text(
                              'All Task',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                              size: 30,
                            )
                          ],
                        )
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: value.dataModel.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DashboardScreen(
                                          details: value.dataModel[index])));
                            },
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, top: 5, bottom: 5),
                                child: ListTile(
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            value.dataModel[index].name != null
                                                ? value.dataModel[index].name
                                                    .toString()
                                                : '',
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.black38),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            LinearPercentIndicator(
                                              width: 150,
                                              lineHeight: 10.0,
                                              percent: (60) / 100,
                                              backgroundColor: Colors.lightBlue,
                                              animation: true,
                                              barRadius:
                                                  const Radius.circular(10),
                                              alignment:
                                                  MainAxisAlignment.center,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              linearGradient:
                                                  const LinearGradient(
                                                colors: [
                                                  Colors.red,
                                                  Colors.orangeAccent,
                                                ],
                                              ),
                                              curve: Curves.linear,
                                              clipLinearGradient: true,
                                              restartAnimation: true,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  leading: CircleAvatar(
                                    child: Image.network(
                                        value.dataModel[index].owner.avatarUrl),
                                  ),
                                  title: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      value.dataModel[index].name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    ),
                                  ),
                                  trailing: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Image.network(value.dataModel[index].owner.starredUrl),
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
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
          elevation: 10,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: 5.0,
          shape: const CircularNotchedRectangle(),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child: const Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
              GestureDetector(
                child: const Icon(
                  Icons.document_scanner_rounded,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
              ),
              const Icon(
                Icons.message,
                color: Colors.black,
              ),
              const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
