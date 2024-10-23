part of 'counter_bloc.dart';

sealed class CounterState {
  final int count;
  final String title;

  const CounterState(this.count, this.title);
}

final class CounterInitial extends CounterState {
  const CounterInitial(super.count, super.title);
}

final class CounterIncrementState extends CounterState {
  const CounterIncrementState(super.count, super.title);
}

final class CounterDecrementState extends CounterState {
  const CounterDecrementState(super.count, super.title);
}

final class CounterApiState extends CounterState {
  CounterApiState(super.count, super.title);
}
