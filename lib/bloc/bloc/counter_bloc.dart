import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(num: 0)) {
    on<CounterEvent>((event, emit) async {
      if (event is CounterIncrement) {
        emit(CounterLoading(num: state.num));
        await Future.delayed(const Duration(seconds: 1));
        emit(CounterLoaded(num: state.num + 1));
        await Future.delayed(const Duration(seconds: 1));
        emit(const CounterError(errorMessage: 'Simple Bloc error'));
      } else if (event is CounterDecrement) {
        emit(CounterLoading(num: state.num));
        await Future.delayed(const Duration(seconds: 1));
        emit(CounterLoaded(num: state.num - 1));
        await Future.delayed(const Duration(seconds: 1));
        emit(const CounterError(errorMessage: 'Simple Bloc error'));
      }
    });
  }
}
