import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_bloc/cubit/daftar_product_cubit.dart';
import 'package:product_bloc/cubit/product_cubit.dart';
import 'package:product_bloc/cubit/product_state.dart';
import 'dart:developer' as developer;

import 'package:product_bloc/page/detail_page.dart';

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
                    const Text(
                        'NIM : 2200939, NAMA : Adrian Mulianto; NIM : 2201017, NAMA : Ilham Akbar'),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<productListCubit>().fetchData();
                      },
                      child: const Text('Reload Daftar Product using Bloc'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    BlocBuilder<productListCubit, List<ProductModel>>(
                        buildWhen: (previousState, state) {
                      developer.log(
                          '${previousState[0].title}->${state[0].title}',
                          name: 'log');
                      return true;
                    }, builder: (context, productList) {
                      return SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            if (productList[0].title != "") {
                              return ListTile(
                                  leading: Image.network(
                                    productList[index].image,
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
                                  title: Text(productList[index].title),
                                  subtitle: Text(productList[index].category),
                                  trailing: const Icon(Icons.more_vert_rounded),
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      context.read<productCubit>().fetchData(
                                          productList[index].id.toString());
                                      return const DetailproductPage();
                                    }));
                                  });
                            }
                            return null;
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
