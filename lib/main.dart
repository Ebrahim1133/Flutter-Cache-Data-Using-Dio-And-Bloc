import 'package:cachedatawithdio/dio_helper.dart';
import 'package:cachedatawithdio/home_cubit/home_cubit.dart';
import 'package:cachedatawithdio/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getAllData(),
      child: const MaterialApp(
        title: 'Flutter Cache Data With Dio',
        debugShowCheckedModeBanner: false,
        home:  HomePage(),
      ),
    );
  }
}

