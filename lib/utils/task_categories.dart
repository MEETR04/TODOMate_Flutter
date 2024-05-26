import 'package:flutter/material.dart';


enum TaskCategories{
  education(Icons.school, Colors.blueGrey),
  health(Icons.health_and_safety, Colors.blue),
  home(Icons.home, Colors.green),
  others(Icons.calendar_month, Colors.purple),
  personal(Icons.person, Colors.lightBlue),
  shopping(Icons.shopping_bag, Colors.red),
  social(Icons.people, Colors.orangeAccent),
  travel(Icons.flight, Colors.yellow),
  work(Icons.work, Colors.purpleAccent);

  final IconData icon;
  final Color color;
  const TaskCategories(this.icon, this.color);

}

