import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc_app/presentation/screens/counter_bloc_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = 'home_screen';
  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(CounterBlocScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              if (state is CounterLoading) {
                return const CircularProgressIndicator();
              } else if (state is CounterError) {
                return Text(state.errorMessage);
              }
              return Text(
                counter.state.num.toString(),
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              );
            },
          ),
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  counter.dec();
                },
                child: const Text('Dec'),
              ),
              ElevatedButton(
                onPressed: () {
                  counter.inc();
                },
                child: const Text('Ink'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
