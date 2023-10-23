import 'package:flutter/material.dart';
import 'package:thiran_technologies/model/items_model.dart';
import 'package:thiran_technologies/tab_bar.dart';

class DashboardScreen extends StatefulWidget {
  Item? details;
  DashboardScreen({super.key, this.details});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.network(widget.details!.owner.avatarUrl),
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 30,
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  widget.details!.name,
                  style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Expanded(child: TabBarMain(tabDetails: widget.details))
            ],
          ),
        ),
      ),
    );
  }
}
