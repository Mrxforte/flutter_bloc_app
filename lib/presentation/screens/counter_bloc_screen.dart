import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/bloc/counter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});
  static const routeName = 'counter_bloc_screen';
  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc Screen'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterLoading) {
                return const CircularProgressIndicator();
              } else if (state is CounterError) {
                return Text(state.errorMessage);
              }
              return Text(
                state.num.toString(),
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
                  counter.add(
                    CounterDecrement(),
                  );
                },
                child: const Text('Dec'),
              ),
              ElevatedButton(
                onPressed: () {
                  counter.add(
                    CounterIncrement(),
                  );
                },
                child: const Text('Inc'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
