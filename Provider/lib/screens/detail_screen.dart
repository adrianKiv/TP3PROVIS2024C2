import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/model/course.dart';
import 'package:my_app/provider/course_provider.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title, required this.icon, required this.description, required this.lecturer, required this.image});
  final String title;
  final IconData icon;
  final String description;
  final String lecturer;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                Align(
                  child: Icon(
                    icon,
                    size: 75,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "$title",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(description),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(image),
                      radius: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      lecturer,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      var courseProvider = context.read<CourseProvider>();
                      bool courseExists = courseProvider.isCourseExists(title);
                      if (!courseExists) {
                        courseProvider.add(
                          Course(
                            icon: icon,
                            name: title,
                            description: description,
                            lecturer: lecturer,
                            lecturerImage: image,
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to Chart successfully'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Course already exists in the chart'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.deepPurple[200],
                      ),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    child: Text(
                      "Add to Chart",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Align(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Add to Favorite ❤️",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
