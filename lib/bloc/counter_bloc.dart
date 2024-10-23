import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0, "bala")) {
    on<CounterIncrementEvent>(_onCounterIncrementEvent);
    on<CounterDecrementEvent>(_onCounterDecrementEvent);
    on<CounterAPIEvent>(_onCounterAPIEvent);
  }

  FutureOr<void> _onCounterIncrementEvent(event, emit) {
    emit(CounterIncrementState(state.count + 1, 'bala'));
  }

  void _onCounterDecrementEvent(event, emit) {
    emit(CounterDecrementState(state.count - 1, 'bala'));
  }

  Future<void> _onCounterAPIEvent(event, emit) async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    emit(CounterApiState(state.count, jsonResponse['title']));
  }
}
