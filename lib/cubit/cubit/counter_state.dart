// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_types_as_parameter_names
part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int num;
  const CounterState({
    required this.num,
  });
}

class CounterInitial extends CounterState {
  const CounterInitial({required super.num});
}

class CounterLoading extends CounterState {
  const CounterLoading({required super.num});
}

class CounterLoaded extends CounterState {
  const CounterLoaded({required super.num});
}

class CounterError extends CounterState {
  final String errorMessage;
  const CounterError({
    required this.errorMessage,
  }) : super(num: 0);
}
