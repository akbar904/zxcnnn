
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.counter_app/widgets/counter_display.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterDisplay Widget', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('should display counter value', (WidgetTester tester) async {
			// Arrange
			when(() => counterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterDisplay(),
					),
				),
			);

			// Assert
			expect(find.text('0'), findsOneWidget);
		});

		testWidgets('should update counter value when state changes', (WidgetTester tester) async {
			// Arrange
			whenListen(counterCubit, Stream.fromIterable([0, 10]));
			when(() => counterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<CounterCubit>(
						create: (_) => counterCubit,
						child: CounterDisplay(),
					),
				),
			);
			await tester.pump(); // Rebuilds the widget with the new state.

			// Assert
			expect(find.text('10'), findsOneWidget);
		});
	});
}
