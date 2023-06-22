import 'package:exam22/screen/todoscreen/controlller/Todocontroller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class todoscreen extends StatefulWidget {
  const todoscreen({Key? key}) : super(key: key);

  @override
  State<todoscreen> createState() => _todoscreenState();
}

class _todoscreenState extends State<todoscreen> {
  @override
  void initState() {
    super.initState();
    controller.readdata();
  }

  Todocintroller controller = Get.put(Todocintroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text("TO-DO", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
            actions: [
              Icon(
                Icons.settings_applications,
                color: Colors.black,
              )
            ]),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/add');
            },
            child: Icon(Icons.add)),
        body: Obx(() =>  ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(
                    color: controller.readTodoList[index]
                    ['priority'] ==
                        "high"
                        ? Colors.green
                        : Colors.yellow),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListTile(
                leading: Text(
                    "${controller.readTodoList[index]['id']}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        "₹ ${controller.readTodoList[index]['todo']}"),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {
                        var id = controller
                            .readTodoList[index]['id'];
                        controller!.delete(id);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        color: Colors.purpleAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: controller.readTodoList.length),
          ),
        ),
    );
  }
}
