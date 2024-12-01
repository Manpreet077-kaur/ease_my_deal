import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/home/cubit/home_cubit.dart';
import 'presentation/home/ui/home_screen.dart';
import 'reuseables/string_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.easeMyDeal,
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeScreen(),
      ),
    );
  }
}