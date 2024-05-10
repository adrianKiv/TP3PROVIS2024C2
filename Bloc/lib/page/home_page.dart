import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umkm_bloc/cubit/daftar_product_cubit.dart';
import 'package:umkm_bloc/cubit/product_cubit.dart';
import 'package:umkm_bloc/cubit/product_state.dart';
import 'dart:developer' as developer;

import 'package:umkm_bloc/page/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          title: Text(
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
                        context.read<umkmListCubit>().fetchData();
                      },
                      child: Text('Reload Daftar UMKM'),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<umkmListCubit, List<umkmModel>>(
                        buildWhen: (previousState, state) {
                      developer.log(
                          '${previousState[0].name}->${state[0].name}',
                          name: 'log');
                      return true;
                    }, builder: (context, umkmList) {
                      return Container(
                        height: 500,
                        child: ListView.builder(
                          itemCount: umkmList.length,
                          itemBuilder: (context, index) {
                            if (umkmList[0].name != "") {
                              return ListTile(
                                  leading: Image.network(
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                                  title: Text(umkmList[index].name),
                                  subtitle: Text(umkmList[index].type),
                                  trailing: Icon(Icons.more_vert_rounded),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      context
                                          .read<umkmCubit>()
                                          .fetchData(umkmList[index].id);
                                      return DetailUmkmPage();
                                    }));
                                  });
                            }
                          },
                        ),
                      );
                    }),
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
