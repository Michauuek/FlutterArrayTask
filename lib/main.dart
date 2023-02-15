import 'package:array_task/service/number_service.dart';
import 'package:array_task/service/number_service_impl.dart';
import 'package:flutter/material.dart';

import 'ui/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  late final INumberService _numberService;

  MyApp({Key? key}) : super(key: key) {
    _numberService = NumberServiceImpl();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Array app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(_numberService),
    );
  }
}
