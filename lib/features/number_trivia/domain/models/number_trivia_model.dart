import 'dart:convert';

class NumberTriviaModel {
  String text;
  int number;
  String type;
  bool found;

  NumberTriviaModel({
    this.text,
    this.number,
    this.type,
    this.found,
  });

  NumberTriviaModel copyWith({
    String text,
    int number,
    String type,
    bool found,
  }) {
    return NumberTriviaModel(
      text: text ?? this.text,
      number: number ?? this.number,
      type: type ?? this.type,
      found: found ?? this.found,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
      'type': type,
      'found': found,
    };
  }

  factory NumberTriviaModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return NumberTriviaModel(
      text: map['text'],
      number: map['number'],
      type: map['type'],
      found: map['found'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NumberTriviaModel.fromJson(String source) =>
      NumberTriviaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'NumberTriviaModel(text: $text, number: $number, type: $type, found: $found)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NumberTriviaModel &&
        o.text == text &&
        o.number == number &&
        o.type == type &&
        o.found == found;
  }

  @override
  int get hashCode {
    return text.hashCode ^ number.hashCode ^ type.hashCode ^ found.hashCode;
  }
}
