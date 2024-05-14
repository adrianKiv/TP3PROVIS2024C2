import 'package:flutter/material.dart';
import 'package:my_app/provider/product_provider.dart';
import 'package:my_app/screens/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:my_app/model/product.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          title: const Text(
            'My App',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Column(
                  children: [
                    Text(
                        'NIM 1, NAMA 1; NIM 2, NAMA 2; Saya berjanji tidak akan berbuat curang data atau membantu orang lain berbuat curang'),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<UserDataProvider>().fetchData();
                      },
                      child: const Text('Reload Daftar UMKM'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Consumer<UserDataProvider>(
                      builder: (context, userDataProvider, child) {
                        return SizedBox(
                          height: 500,
                          child: ListView.builder(
                            itemCount: userDataProvider.userData.length,
                            itemBuilder: (context, index) {
                              if (userDataProvider.userData[index].title != "") {
                                return ListTile(
                                  leading: Image.network(
                                    userDataProvider.userData[index].image,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress
                                                      .expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                        ),
                                      );
                                    },
                                  ),
                                  title: Text(userDataProvider.userData[index].title),
                                  subtitle: Text(userDataProvider.userData[index].category),
                                  trailing: const Icon(Icons.more_vert_rounded),
                                 onTap: () {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) {
      return DetailproductPage(index: userDataProvider.userData[index].id,);
    }),
  );
}
,
                                );
                              }
                              return null;
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
