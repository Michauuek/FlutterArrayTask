
import 'package:array_task/service/number_service.dart';
import 'package:array_task/ui/result_screen.dart';
import 'package:flutter/material.dart';

import '../exception/array_convert.dart';
import '../exception/wrong_array_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.numberService, {Key? key}) : super(key: key);
  final INumberService numberService;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: myController,
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  var inputArray = widget.numberService.convertInput(myController.value.text);
                  debugPrint('ElevatedButton Clicked $inputArray');

                  var num = widget.numberService.findDifferentNumber(inputArray);
                  debugPrint('ElevatedButton Clicked $num');

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(number: num),
                    ),
                  );
                } on WrongArraySizeException catch(e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Array should contains at least 3 elements"),
                        )
                    );
                }
                on ArrayConvertException catch(e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Array can contain only numbers and cannot be null"),
                      )
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  primary: Colors.green
              ),
              child: const Text('Search'),
            )
          ],
        ),
      ),
    );
  }
}