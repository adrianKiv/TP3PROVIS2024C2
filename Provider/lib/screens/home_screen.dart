import 'package:flutter/material.dart';
import 'package:my_app/screens/detail_screen.dart';
import 'package:my_app/model/course.dart';
import 'package:my_app/widgets/custom_appBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map> category = [
      {
        "icons": Icon(
          Icons.shopify_rounded,
          size: 32,
        ),
        "name_category": "Shop"
      },
      {
        "icons": Icon(
          Icons.bar_chart,
          size: 32,
        ),
        "name_category": "Leaderboard"
      },
      {
        "icons": Icon(
          Icons.abc,
          size: 32,
        ),
        "name_category": "Achievements"
      },
      {
        "icons": Icon(
          Icons.favorite,
          size: 32,
        ),
        "name_category": "Favorite"
      }
    ];
    final List<Map> skills = [
      {
        "icons": Icons.book,
        "skill_name": "UI Design Fundamentals",
        "desc": "32 Questions  3.8k participants"
      },
      {
        "icons": Icons.laptop_mac,
        "skill_name": "UI Desin Fundamentals",
        "desc": "28 Questions  3.1k participants"
      },
      {
        "icons": Icons.web,
        "skill_name": "Web Design",
        "desc": "45 Questions  4.8k participants"
      },
      {
        "icons": Icons.phone_android,
        "skill_name": "Mobile Design",
        "desc": "37 Questions  3.9k participants"
      },
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.grey[400]),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemCount: category.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        category[index]["icons"],
                        SizedBox(width: 8),
                        Text(
                          category[index]["name_category"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Course",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 125,
              child: ListView.builder(
                itemCount: courses.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final cs = courses[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage(
                              icon: cs.icon,
                              title: cs.name,
                              description: cs.description,
                              lecturer: cs.lecturer,
                              image: cs.lecturerImage,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              cs.icon,
                              size: 32,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              cs.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Skill Tests",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemCount: skills.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Icon(skills[index]["icons"]),
                        title: Text(skills[index]["skill_name"]),
                        subtitle: Text(skills[index]["desc"]),
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
