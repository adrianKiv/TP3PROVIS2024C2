import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_bloc/cubit/product_cubit.dart';
import 'package:product_bloc/cubit/product_state.dart';
import 'dart:developer' as developer;

class DetailproductPage extends StatelessWidget {
  const DetailproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<productCubit, ProductModel>(
                buildWhen: (previousState, state) {
              developer.log('${previousState.title}->${state.title}',
                  name: 'log');
              return true;
            }, builder: (context, detailProduct) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Image.network(
                          detailProduct.image,
                          width: 100, // lebar gambar
                          height: 100, // tinggi gambar
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          'Nama: ${detailProduct.title}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text("price: ${detailProduct.price}",
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text('category: ${detailProduct.category} ',
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text('description: ${detailProduct.description}',
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text('Rating: ${detailProduct.rating.rate}',
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text('Number of Ratings: ${detailProduct.rating.count}',
                            style: const TextStyle(color: Colors.white)),
                        const SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ));
  }
}
