import 'package:flutter/material.dart';

class TabButtons extends StatelessWidget {
  final bool isAskingQuestion;
  final VoidCallback onSwitchToAsk;
  final VoidCallback onSwitchToTryAnswer;

  const TabButtons({
    Key? key,
    required this.isAskingQuestion,
    required this.onSwitchToAsk,
    required this.onSwitchToTryAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: isAskingQuestion ? null : onSwitchToAsk,
          child: Text('Ask Question'),
        ),
        ElevatedButton(
          onPressed: isAskingQuestion ? onSwitchToTryAnswer : null,
          child: Text('Try Answer'),
        ),
      ],
    );
  }
}
