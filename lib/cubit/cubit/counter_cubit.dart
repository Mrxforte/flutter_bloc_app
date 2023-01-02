import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(num: 0));
  Future<void> inc() async {
    emit(CounterLoading(num: state.num));
    await Future.delayed(const Duration(seconds: 1));
    emit(const CounterError(errorMessage: 'Testing making error'));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterLoaded(num: state.num + 1));
  }

  Future<void> dec() async {
    emit(CounterLoading(num: state.num));
    await Future.delayed(const Duration(seconds: 1));
    emit(const CounterError(errorMessage: 'Testing making error'));
    await Future.delayed(const Duration(seconds: 1));
    emit(CounterLoaded(num: state.num - 1));
  }
}
