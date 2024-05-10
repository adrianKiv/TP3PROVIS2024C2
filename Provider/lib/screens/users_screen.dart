import 'package:flutter/material.dart';
import 'package:my_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserDataProvider>(context);

    if (userModel.userData == null) {
      userModel.fetchData();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Data Example'),
        ),
        body: Consumer<UserDataProvider>(
          builder: (context, userModel, _) {
            if (userModel.userData == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        elevation: 4,
                        margin: EdgeInsets.all(16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage("${userModel.userData!.picture}"),
                                radius: 75,
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Name: ${userModel.userData!.fullName}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Location: ${userModel.userData!.location}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Register Date: ${userModel.userData!.registerDate.substring(0, 10)}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            userModel.fetchData();
          },
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }
}
