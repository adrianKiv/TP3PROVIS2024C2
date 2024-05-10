import 'package:flutter/material.dart';
import 'package:my_app/provider/course_provider.dart';
import 'package:my_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: _CourseList(),
            ),
          ),
          const Divider(height: 2, color: Colors.black),
          _CartTotal()
        ],
      ),
    );
  }
}

class _CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleMedium;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var provider = context.watch<CourseProvider>();

    return ListView.builder(
      itemCount: provider.courses.length,
      itemBuilder: (context, index) => ListTile(
          leading: Icon(provider.courses[index].icon),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              provider.remove(provider.courses[index]);
            },
          ),
          title: Text(
            provider.courses[index].name,
            style: itemNameStyle,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  title: provider.courses[index].name,
                  icon: provider.courses[index].icon,
                  description: provider.courses[index].description,
                  lecturer: provider.courses[index].lecturer,
                  image: provider.courses[index].lecturerImage,
                ),
              ),
            );
          }),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CourseProvider>(builder: (context, value, _) => Text('\$${value.totalPrice}', style: hugeStyle)),
            const SizedBox(width: 24),
            FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Buying not supported yet.')));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white, backgroundColor: Colors.deepPurple[200]),
              child: const Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}
