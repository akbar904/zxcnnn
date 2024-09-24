
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:counter_app/main.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('Main App Tests', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = MockCounterCubit();
		});

		testWidgets('Counter App initializes correctly', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(MaterialApp), findsOneWidget);
			expect(find.byType(HomeScreen), findsOneWidget);
		});

		testWidgets('HomeScreen contains increment button and counter display', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: counterCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Counter: 0'), findsOneWidget);
		});

		testWidgets('Counter increments by 10 when button is pressed', (WidgetTester tester) async {
			when(() => counterCubit.state).thenReturn(0);
			whenListen(counterCubit, Stream.fromIterable([0, 10]));

			await tester.pumpWidget(
				BlocProvider<CounterCubit>.value(
					value: counterCubit,
					child: MaterialApp(
						home: HomeScreen(),
					),
				),
			);

			expect(find.text('Counter: 0'), findsOneWidget);

			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			expect(find.text('Counter: 10'), findsOneWidget);
		});
	});
}
