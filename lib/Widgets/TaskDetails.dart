import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todomate/Widgets/circlecontainericons.dart';
import 'package:todomate/models/models.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            circlecontainer(color: task.category.color, child: Icon(task.category.icon),),
            const SizedBox( height: 15,),
            Text(task.title,style: const TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.bold,),),
            const SizedBox( height: 5,),
            Text(task.time,style: const TextStyle(fontFamily: "Poppins",)),
            const SizedBox( height: 20,),
            Visibility(
              visible: !task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Task to be completed on ${task.date}'),
                  Icon(Icons.check_box,color: task.category.color,)
                ],
              ),
            ),
          const SizedBox(height: 10,), Divider( thickness: 1.5,
            color: task.category.color,
          ),
          Text(task.note.isEmpty?'There is no description': task.note),
            Visibility(
              visible: task.isCompleted,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Task completed'),
                  Icon(Icons.check_box,color: task.category.color,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
