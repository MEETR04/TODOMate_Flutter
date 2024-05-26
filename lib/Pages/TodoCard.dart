import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoCard extends StatefulWidget {
  const TodoCard(
      this.title,
      this.date,
      this.time,
      this.category, {super.key}

      );
  final String title;
  final String date;
  final String time;
  final String category;

  @override
  State<TodoCard> createState() => _TodoCardState();

}
class _TodoCardState extends State<TodoCard> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
            scale: 1.5,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              value: isChecked,
              onChanged: (value) {
                setState(() {
                    isChecked = value;
                });
              },
              checkColor: Colors.white,
              activeColor: const Color(0xff003366),
            )),
        Expanded(
            child: SizedBox(
              height: 75,
              child: Card(
                color: Colors.transparent,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.date,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 10
                            ),
                            Text(
                              widget.time,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 10
                            ),
                            Text(
                              widget.category,
                              style: const TextStyle(
                                color: Colors.black,
                                fontFamily: "Poppins",
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),

                  ],
                ),
              ),
            ))
      ],
    );
  }
}
