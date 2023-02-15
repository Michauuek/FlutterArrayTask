
import 'package:array_task/exception/array_convert.dart';
import 'package:array_task/exception/wrong_array_size.dart';
import 'package:array_task/service/number_service.dart';

class NumberServiceImpl implements INumberService {

  @override
  int findDifferentNumber(List<int> arr) {

    if(_isArrayEven(arr)){
      for(var num in arr){
        if(!_isEven(num)){
          return num;
        }
      }
    } else {
      for(var num in arr){
        if(_isEven(num)){
          return num;
        }
      }
    }

    return -1;
  }

  @override
  List<int> convertInput(String input) {

    if(input.trim().isEmpty){
      throw ArrayConvertException("Input cannot contain null");
    }

    var inputList = input
        .replaceAll(' ', '')
        .replaceAll('[', '')
        .replaceAll(']', '')
        .split(',');

    if(!_isInputValid(inputList)){
      throw ArrayConvertException("Not valid input");
    }

    return inputList.map((item) => int.parse(item)).toList();
  }

  bool _isArrayEven(List<int> arr) {

    if(arr.length < 3){
      throw WrongArraySizeException("Array should contains at least 3 elements");
    }

    int evenCount = 0;
    int oddCount = 0;

    for(int i = 0; i < 3; i++){
      if(_isEven(arr[i])){
        evenCount++;
      }
      else {
        oddCount++;
      }
    }
    return evenCount > oddCount ? true : false;
  }

  bool _isEven(int num) => num % 2 == 0 ? true : false;

  bool _isInputValid(List<String> input) =>
      input.every((item) => RegExp(r'^-?[0-9]+$').hasMatch(item));

}