import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red.shade200,
            borderRadius: BorderRadius.circular(12.0),),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              //chackBox
              Checkbox(value: taskCompleted, onChanged: onChanged,activeColor: Colors.black,),
              //task name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(taskName, style: TextStyle(
                    decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                  ),),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}
