
class CounterModel {
	int value;

	CounterModel({required this.value});

	void increment() {
		value *= 10;
	}

	Map<String, dynamic> toJson() {
		return {'value': value};
	}

	static CounterModel fromJson(Map<String, dynamic> json) {
		return CounterModel(value: json['value']);
	}
}
