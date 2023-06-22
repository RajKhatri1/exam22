import 'package:exam22/screen/addtodoscreen/view/Addscreen.dart';
import 'package:exam22/screen/todoscreen/view/TodoScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => todoscreen(),),
        GetPage(name: '/add', page: () => Addscreen(),),
      ],
    ),
  );
}

