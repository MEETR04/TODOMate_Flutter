import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todomate/Widgets/TaskDetails.dart';
import 'package:todomate/Widgets/circlecontainericons.dart';
import 'package:todomate/Widgets/taskcontainer.dart';
import '../models/task.dart';


class listoftasks extends StatelessWidget {
  const listoftasks(
      {super.key, required this.tasks, required this.istasksCompleted});

  final List<Task> tasks;
  final bool istasksCompleted;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance.collection("Todo").snapshots();
    final emptytaskmessage = istasksCompleted
        ? 'There are no tasks completed yet'
        : 'There is no task todo';
    return taskcontainer(
        child: tasks.isEmpty
            ? Center(
                child: Text(
                  emptytaskmessage,
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              )
            : StreamBuilder(
          stream: _stream,
              builder: (context, snapshot){
              return ListView.separated(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.docs.length ?? 0,
                  padding: EdgeInsets.zero,
                  itemBuilder: (ctx, index) {
                    final task = tasks[index];
                    return InkWell(
                      onLongPress: () {
              
                      },
                      onTap: () async{
                        await showModalBottomSheet(context: context, builder: (ctx){
                          return TaskDetails(task: task);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                           circlecontainer(color: task.category.color,
                           child: Icon(task.category.icon),),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(task.title, style: const TextStyle(fontFamily: "Poppins",fontWeight: FontWeight.bold)),
                                  Text(task.time, style: const TextStyle(fontFamily: "Poppins"),),
                                ],
                              ),
                            ),
                            Checkbox(value: task.isCompleted, onChanged: (value) {})
                          ],
                      
                        ),
                      ),
                    );
                  }, separatorBuilder: (BuildContext context, int index) {
                    return const Divider(thickness: 1.5);
                      },);}
            ));
  }
}
