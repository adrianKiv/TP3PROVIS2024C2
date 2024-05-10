import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:umkm_bloc/cubit/daftar_product_cubit.dart';
import 'package:umkm_bloc/cubit/product_cubit.dart';
import 'package:umkm_bloc/page/home_page.dart';

//model berisi data/state

//cubit untuk acvtivity model

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: [
          BlocProvider<productListCubit>(
            create: (_) => productListCubit(),
          ),
          BlocProvider<productCubit>(
            create: (_) => productCubit(),
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
