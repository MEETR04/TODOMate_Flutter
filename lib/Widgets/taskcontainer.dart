import 'package:flutter/cupertino.dart';

class taskcontainer extends StatelessWidget {
  const taskcontainer({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffcce5ff),
      ),
      child: child,
    );
  }
}
