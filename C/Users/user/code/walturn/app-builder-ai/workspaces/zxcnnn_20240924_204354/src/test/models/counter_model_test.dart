
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app/models/counter_model.dart';

void main() {
	group('CounterModel', () {
		test('Counter value initialization', () {
			final counter = CounterModel(value: 0);
			expect(counter.value, 0);
		});

		test('Counter value increment by 10', () {
			final counter = CounterModel(value: 0);
			counter.increment();
			expect(counter.value, 10);
		});

		test('Counter value serialization to JSON', () {
			final counter = CounterModel(value: 10);
			final json = counter.toJson();
			expect(json, {'value': 10});
		});

		test('Counter value deserialization from JSON', () {
			final json = {'value': 10};
			final counter = CounterModel.fromJson(json);
			expect(counter.value, 10);
		});
	});
}

class CounterModel {
	int value;

	CounterModel({required this.value});

	void increment() {
		value += 10;
	}

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	static CounterModel fromJson(Map<String, dynamic> json) {
		return CounterModel(value: json['value']);
	}
}
