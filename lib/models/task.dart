
import 'package:equatable/equatable.dart';
import '../utils/task_categories.dart';
class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategories category;


 const Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
    required this.category
  });



  @override
  List get props {
    return [
      id!,
      title,
      note,
      time,
      date,
      isCompleted,
    ];
  }
}
