
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key, required this.number}) : super(key: key);
  final int number;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                  "${widget.number}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40)
              )
            )
          ],
        ),
      ),
    );
  }
}
