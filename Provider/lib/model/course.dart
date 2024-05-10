import 'package:flutter/material.dart';

class Course {
  final IconData icon;
  final String name;
  final String description;
  final String lecturer;
  final String lecturerImage;

  Course({
    required this.icon,
    required this.name,
    required this.description,
    required this.lecturer,
    required this.lecturerImage,
  });
}

final List<Course> courses = [
  Course(
    icon: Icons.book,
    name: "UI Design Fundamentals",
    description: "Learn the basics of UI design including principles, techniques, and tools.",
    lecturer: "Riski",
    lecturerImage: "https://images.unsplash.com/photo-1474511320723-9a56873867b5?q=80&w=1772&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Course(
    icon: Icons.laptop_mac,
    name: "UI Design Advanced",
    description: "Take your UI design skills to the next level with advanced topics and hands-on projects.",
    lecturer: "Maikel Ucup",
    lecturerImage: "https://images.unsplash.com/photo-1497752531616-c3afd9760a11?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Course(
    icon: Icons.web,
    name: "Web Design",
    description: "Explore web design principles, HTML, CSS, and responsive design.",
    lecturer: "Faiz",
    lecturerImage: "https://images.unsplash.com/photo-1589656966895-2f33e7653819?q=80&w=1770&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  ),
  Course(
    icon: Icons.phone_android,
    name: "Mobile Design",
    description: "Learn mobile design principles, user experience (UX), and mobile app prototyping.",
    lecturer: "Ihsan",
    lecturerImage: "https://images.unsplash.com/photo-1558954350-2bc4ea82347f?q=80&w=2015&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  )
];
