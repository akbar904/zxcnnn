
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/counter_cubit.dart';

class CounterDisplay extends StatelessWidget {
	const CounterDisplay({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return BlocBuilder<CounterCubit, int>(
			builder: (context, state) {
				return Center(
					child: Text(
						'$state',
						style: TextStyle(fontSize: 24),
					),
				);
			},
		);
	}
}
