import 'package:flutter/material.dart';

abstract class ListItem {
  Widget buildLine(BuildContext context);
}

class Item implements ListItem {
  final int index;

  Item(this.index);

  bool isPrime(int number) {
    for (var i = 2; i <= number / i; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  String getImage(int index) {
    return isPrime(index) && index != 1 ? "assets/images/ananas.png" : index % 2 == 0 ? "assets/images/poire.png" : "assets/images/pomme.png";
  }

  @override
  Widget buildLine(BuildContext context) => Row(
    children: [
      Image.asset(getImage(index), width: 60, height: 60,),
      Text("$index", style: const TextStyle(fontSize: 35),),
    ],
  );
}