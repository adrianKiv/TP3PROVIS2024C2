import 'package:flutter/material.dart';
import 'package:my_app/model/course.dart';

class CourseProvider extends ChangeNotifier {
  final List<Course> _courses = [];

  int get totalPrice => _courses.length * 10;
  List<Course> get courses => _courses;

  void add(Course course) {
    _courses.add(course);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void remove(Course course) {
    _courses.remove(course);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  bool isCourseExists(String courseName) {
    return _courses.any((course) => course.name == courseName);
  }
}
