import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoBottom extends StatefulWidget {
  const TodoBottom(
      this.title,
      this.date,
      this.time,
      this.category,
      this.note, {super.key}

      );
  final String title;
  final String date;
  final String time;
  final String category;
  final String note;

  @override
  State<TodoBottom> createState() => _TodoBottomState();

}
class _TodoBottomState extends State<TodoBottom> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Title : ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.title,style: const TextStyle(fontFamily: "Poppins",color: Colors.grey,fontSize: 20),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("Date : ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.date,style: const TextStyle(fontFamily: "Poppins",color: Colors.grey,fontSize: 20),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("Time : ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.time,style: const TextStyle(fontFamily: "Poppins",color: Colors.grey,fontSize: 20),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("Category : ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.category,style: const TextStyle(fontFamily: "Poppins",color: Colors.grey,fontSize: 20),),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              const Text("Description : ",style: TextStyle(fontFamily: "Poppins",color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.note,style: const TextStyle(fontFamily: "Poppins",color: Colors.grey,fontSize: 20),),
            ],
          )
        ],
      ),
    );
  }
}
