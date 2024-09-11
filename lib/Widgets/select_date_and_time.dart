import 'package:flutter/material.dart';

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
              const Text("Date", style: TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold),),
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
        ),
        const SizedBox(width: 10),
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
}
