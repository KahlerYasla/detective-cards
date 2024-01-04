import 'package:flutter/foundation.dart';

class DetectiveCard {
  final String id;
  final String riddle;
  final String answer;

  DetectiveCard({
    required this.id,
    required this.riddle,
    required this.answer,
  });

  factory DetectiveCard.fromJson(Map<String, dynamic> json) {
    return DetectiveCard(
      id: json['id'],
      riddle: json['riddle'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'riddle': riddle,
      'answer': answer,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DetectiveCard &&
        other.id == id &&
        other.riddle == riddle &&
        other.answer == answer;
  }

  @override
  int get hashCode {
    return id.hashCode ^ riddle.hashCode ^ answer.hashCode;
  }
}
