import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/dbhelper.dart';
import '../../todoscreen/controlller/Todocontroller.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({Key? key}) : super(key: key);

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  Todocintroller controller = Get.put(Todocintroller());
  TextEditingController txttodo = TextEditingController();
  TextEditingController txtpriority = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("To-Do", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: txttodo,
                decoration: InputDecoration(
                  hintText: "enter todo",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtpriority,
                decoration: InputDecoration(
                  hintText: "enter priority",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                DbHelper dbhelper = DbHelper();
                dbhelper.insertData(
                    priority: txtpriority.text,
                    todo: txttodo.text);
                controller.dbHelper.readData();

                Get.back();
              }, child: Text("Add task"),),
            ],
          ),
        ),
      ),
    );
  }
}
