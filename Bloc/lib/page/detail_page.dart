import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umkm_bloc/cubit/product_cubit.dart';
import 'package:umkm_bloc/cubit/product_state.dart';
import 'dart:developer' as developer;

class DetailUmkmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<umkmCubit, umkmModel>(
                buildWhen: (previousState, state) {
              developer.log('${previousState.name}->${state.name}',
                  name: 'log');
              return true;
            }, builder: (context, umkmDetail) {
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
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          'Nama: ${umkmDetail.name}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Detail: ${umkmDetail.type}',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text("Membe Sejak: ${umkmDetail.memberSejak}",
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Omzet: ${umkmDetail.omzetBulan} ',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text('Lama: ${umkmDetail.lamaUsaha}',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(
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
