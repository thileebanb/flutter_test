import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/counter_bloc.dart';

/// {@template counter_view}
/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
/// {@endtemplate}
class CounterView extends StatefulWidget {
  /// {@macro counter_view}
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                Text('${state.count}', style: textTheme.displayMedium),
                Text(state.title, style: textTheme.displayMedium),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                key: const Key('counterView_increment_floatingActionButton'),
                child: const Icon(Icons.add),
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterIncrementEvent()),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                key: const Key('counterView_decrement_floatingActionButton'),
                child: const Icon(Icons.remove),
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterDecrementEvent()),
              ),
              FloatingActionButton(
                key: const Key('counterView_api_floatingActionButton'),
                child: const Icon(Icons.macro_off),
                onPressed: () =>
                    context.read<CounterBloc>().add(CounterAPIEvent()),
              ),
            ],
          ),
        );
      },
    );
  }
}
