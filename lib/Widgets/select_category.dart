import 'package:flutter/material.dart';

class selectcategory extends StatelessWidget {
  selectcategory({super.key, required this.taskcategorycontroller});
  Color primaryColor = const Color(0xff003366);
  TextEditingController taskcategorycontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 1),
        child: Row(
          children: [
            const Text("Category",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              width: 8,
            ),
            Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                chipdata("Travel", 0xff003366),
                const SizedBox(width: 5,),
                chipdata("Health", 0xff003366),
                const SizedBox(width: 5,),
                chipdata("Office", 0xff003366),
                const SizedBox(width: 5,),
                chipdata("Personal", 0xff003366),
                const SizedBox(width: 5,),
                chipdata("Finance", 0xff003366)
              ],
            )
            )

          ],
        ),
      ),
    );
  }
  Widget chipdata(String label, int color){
    return Chip(backgroundColor: Color(color),shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    ),
        label: Text(label,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18,fontFamily: "Poppins",color: Colors.white),));
  }
}
