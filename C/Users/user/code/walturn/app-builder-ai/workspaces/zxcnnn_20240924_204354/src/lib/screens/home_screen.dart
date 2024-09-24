
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/widgets/counter_display.dart';

class HomeScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Counter App'),
			),
			body: Center(
				child: CounterDisplay(),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					context.read<CounterCubit>().increment();
				},
				child: Text('Increment'),
			),
		);
	}
}
