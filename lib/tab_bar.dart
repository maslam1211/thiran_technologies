import 'package:flutter/material.dart';
import 'package:thiran_technologies/model/items_model.dart';

import 'all_tab.dart';
import 'completed_tab.dart';
import 'ongoing_tab.dart';

class TabBarMain extends StatefulWidget {
  
  Item? tabDetails;
  TabBarMain({super.key, this.tabDetails});

  @override
  State<TabBarMain> createState() => _TabBarMainState();
}

class _TabBarMainState extends State<TabBarMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Text(''),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: Size.zero,
            child: Container(
              height: 45,
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: Colors.grey[200],
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.purple,
                  ),
                  tabs: const [
                    Center(
                      child: Tab(
                        text: 'All',
                      ),
                    ),
                    Center(
                      child: Tab(
                        text: 'Ongoing',
                      ),
                    ),
                    Center(
                      child: Tab(
                        text: 'Completed',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics:  const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: AllTab(details: widget.tabDetails),
            ),
            const onGoingTab(),
            const CompletedTab()
          ],
        ),
      ),
    );
  }
}
