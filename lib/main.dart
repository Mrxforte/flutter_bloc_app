import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc_app/cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/presentation/screens/counter_bloc_screen.dart';
import 'package:flutter_bloc_app/presentation/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Counter Bloc App',
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          CounterBlocScreen.routeName: (context) => const CounterBlocScreen(),
        },
      ),
    );
  }
}
