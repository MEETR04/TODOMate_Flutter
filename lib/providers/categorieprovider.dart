import 'package:riverpod/riverpod.dart';
import 'package:todomate/utils/utils.dart';

final categoryProvider = StateProvider<TaskCategories>((ref){
  return TaskCategories.others;
});