import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thiran_technologies/controller/provider/data_provider.dart';
import 'package:thiran_technologies/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider
    (
       providers: [
        ChangeNotifierProvider(create: (context) => DataProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
