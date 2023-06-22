import 'package:get/get.dart';

import '../../../utils/dbhelper.dart';

class Todocintroller extends GetxController {
  RxList<Map> readTodoList = <Map>[].obs;
  DbHelper dbHelper = DbHelper();

  Future<void> readdata() async {
    DbHelper dbHelper = DbHelper();
    readTodoList.value = await dbHelper.readData();
  }

  void filterDataRead(String priority) async {
    DbHelper dbHelper = DbHelper();
    readTodoList.value = await dbHelper.filterRead(priority: priority);
  }

  void delete(int id) {
    DbHelper dbHelper = DbHelper();
    dbHelper.deleteData(id: id);
    readdata();
  }
}