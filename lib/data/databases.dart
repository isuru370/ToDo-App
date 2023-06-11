
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List toDoList = [];
  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the first time ever opening this app
void createInitialData(){
  toDoList = [
    ["Make Tutorial", false],
    ["Do Exercise", false],
  ];
}
// load the data from databases
void loadData(){
  toDoList = _myBox.get("TODOLIST");
}

//update the databases
void updateDate(){
  _myBox.put("TODOLIST", toDoList);
}

}