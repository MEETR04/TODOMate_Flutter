import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/task_categories.dart';
class circlecontainer extends StatelessWidget {
  const circlecontainer({super.key, required this.color, this.child, this.task});
  final Color color;
  final Widget? child;
  final Task? task;

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(10),
       decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: color,
           border: Border.all(
               width: 2, color: color)),
       child: Center(
         child: child,
       ),
     );
  }
}
