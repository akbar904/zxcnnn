
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/screens/home_screen.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/widgets/counter_display.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		testWidgets('should display CounterDisplay widget', (WidgetTester tester) async {
			// Arrange
			final counterCubit = MockCounterCubit();
			when(() => counterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.byType(CounterDisplay), findsOneWidget);
		});

		testWidgets('should display increment button', (WidgetTester tester) async {
			// Arrange
			final counterCubit = MockCounterCubit();
			when(() => counterCubit.state).thenReturn(0);

			// Act
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: counterCubit,
						child: HomeScreen(),
					),
				),
			);

			// Assert
			expect(find.byType(FloatingActionButton), findsOneWidget);
			expect(find.text('Increment'), findsOneWidget);
		});
	});

	group('CounterCubit State Management Tests', () {
		blocTest<CounterCubit, int>(
			'emits [0, 10] when increment is called',
			build: () => CounterCubit(),
			act: (cubit) => cubit.increment(),
			expect: () => [0, 10],
		);

		blocTest<CounterCubit, int>(
			'emits [0, 10, 20] when increment is called twice',
			build: () => CounterCubit(),
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [0, 10, 20],
		);
	});
}
