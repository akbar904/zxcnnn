
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_cubit.dart';
import 'package:counter_app/cubits/counter_state.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {}

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is CounterState with value 0', () {
			expect(counterCubit.state, CounterState(0));
		});

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(10)] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emits [CounterState(20)] when increment is called twice',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.increment();
			},
			expect: () => [CounterState(10), CounterState(20)],
		);
	});
}
