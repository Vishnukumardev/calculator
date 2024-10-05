import 'package:calculator_app/src/Provider/Provider.dart';
import 'package:calculator_app/src/controller/calculatorcontroller.dart';
import 'package:calculator_app/src/screens/calculatorscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderState(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(Calculatorcontroller());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: Provider.of<ProviderState>(context).themeData,
      home: Calculatorscreen(),
    );
  }
}
