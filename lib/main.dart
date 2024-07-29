import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/cubit/adressess_cubit.dart';
import 'package:second/cubit/products_cubit.dart';
import 'package:second/dio_helper2.dart';
import 'package:second/screens/home_screen.dart';

import 'dio_helper.dart';

void main() {
  DioHelper.init();
  DioHelper2.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsCubit()..getHomeData(),
        ),
        BlocProvider(
          create: (context) => AdressessCubit(),
        ),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
