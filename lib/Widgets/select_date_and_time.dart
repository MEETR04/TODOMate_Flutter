import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/helpers.dart';

class selectdateandtime extends StatefulWidget {
  const selectdateandtime({super.key});

  @override
  State<selectdateandtime> createState() => _selectdateandtimeState();
}

class _selectdateandtimeState extends State<selectdateandtime> {
  TextEditingController taskdatecontroller = TextEditingController();
  TextEditingController tasktimecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date", style: const TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              TextField(
                controller: taskdatecontroller,
                cursorColor: Colors.green,
                maxLines: 1,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Select date",
                  suffixIcon: IconButton(
                    onPressed: () {
                      _selectDate();
                    },
                    icon: const Icon(Icons.date_range),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 2)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.blueGrey,width: 2)
                  ),
                ),
              )
            ],
          ),
          // child: commontextfield(
          //   controller: taskdatecontroller,
          //   maxlines: 1,
          //   title: 'Date',
          //   hinttext: DateFormat.yMMMMd().format(date),
          //   suffixicon: IconButton(
          //     onPressed: () => _selectDate(context, ref),
          //     icon: const Icon(Icons.date_range),
          //   ),
          //   readonly: true,
          // ),
        ),
        const SizedBox(width: 10),
        // Expanded(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Time", style: const TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold),),
        //       const SizedBox(height: 10,),
        //       TextField(
        //         controller: tasktimecontroller,
        //         cursorColor: Colors.green,
        //         maxLines: 1,
        //         readOnly: true,
        //         decoration: InputDecoration(
        //           hintText: Helpers.timetoString(time),
        //           suffixIcon: IconButton(
        //             onPressed: () => _selectTime(context, ref),
        //             icon: const Icon(Icons.access_time),
        //           ),
        //           enabledBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(20),
        //               borderSide: const BorderSide(color: Colors.blueGrey,width: 2)
        //           ),
        //           focusedBorder: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(20),
        //               borderSide: const BorderSide(color: Colors.blueGrey,width: 2)
        //           ),
        //         ),
        //       )
        //     ],
        //   ),
        //   // child: commontextfield(
        //   //   controller: tasktimecontroller,
        //   //   maxlines: 1,
        //   //   title: 'Time',
        //   //   hinttext: Helpers.timetoString(time),
        //   //   suffixicon: IconButton(
        //   //     onPressed: () => _selectTime(context, ref),
        //   //     icon: const Icon(Icons.access_time),
        //   //   ),
        //   //   readonly: true,
        //   // ),
        // ),
      ],
    );
  }
  Future<void> _selectDate() async {
    DateTime? _picked =
    await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2100));
    if(_picked != null){
      setState(() {
        taskdatecontroller.text = _picked.toString().split(" ")[0];
      });
    }
  }
  Future<void> _selectTime() async{

  }
}
