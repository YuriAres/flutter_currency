import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_currency/home.dart';
import 'package:flutter_currency/test.dart';

void main(List<String> args) {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MaterialApp(
      home: const Myapp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        disabledColor: Colors.grey[700],
      )));
}
