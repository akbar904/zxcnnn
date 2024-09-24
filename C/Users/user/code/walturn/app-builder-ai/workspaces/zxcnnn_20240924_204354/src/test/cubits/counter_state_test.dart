
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:counter_app/cubits/counter_state.dart';

void main() {
	group('CounterState', () {
		// Test initial state
		test('initial state is CounterState with counter value 0', () {
			final state = CounterState();
			expect(state.counter, 0);
		});

		// Test state equality
		test('state equality works correctly', () {
			final state1 = CounterState(counter: 10);
			final state2 = CounterState(counter: 10);
			expect(state1, state2);
		});

		// Test hashCode
		test('hashCode works correctly', () {
			final state = CounterState(counter: 10);
			expect(state.hashCode, state.counter.hashCode);
		});

		// Test copyWith method
		test('copyWith method works correctly', () {
			final state = CounterState(counter: 10);
			final newState = state.copyWith(counter: 20);
			expect(newState.counter, 20);
		});
	});
}
