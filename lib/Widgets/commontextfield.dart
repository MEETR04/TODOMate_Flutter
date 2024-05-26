import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class commontextfield extends StatelessWidget {
  const commontextfield({super.key, required this.title, required this.hinttext, required this.maxlines, required this.suffixicon, required this.readonly, required this.controller});
  final String title;
  final String hinttext;
  final int? maxlines;
  final Widget? suffixicon;
  final bool readonly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontFamily: "Poppins", fontSize: 20,fontWeight: FontWeight.bold),),
        const SizedBox(height: 10,),
        TextField(
          cursorColor: Colors.green,
          maxLines: maxlines,
          readOnly: readonly,
          decoration: InputDecoration(
            hintText: hinttext,
            suffixIcon: suffixicon,
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
    );
  }
}
