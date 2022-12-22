import 'package:flutter/material.dart';
import 'package:todo/constants/styles.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const Center(
      child: Text(
        "Todo App",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
    backgroundColor: appBGColor,
    elevation: 0,
  );
}
