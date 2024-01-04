import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final Function(String) onAskQuestion;
  final Function(String) onTryAnswer;

  const TextFieldWidget({
    Key? key,
    required this.onAskQuestion,
    required this.onTryAnswer,
  }) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _controller = TextEditingController();
  bool _isAskingQuestion = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText:
                _isAskingQuestion ? 'Ask a question...' : 'Try an answer...',
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _isAskingQuestion
                    ? widget.onAskQuestion(_controller.text)
                    : widget.onTryAnswer(_controller.text);
              },
              child: Text(_isAskingQuestion ? 'Ask' : 'Try Answer'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isAskingQuestion = !_isAskingQuestion;
                  _controller.clear();
                });
              },
              child: Text(
                  _isAskingQuestion ? 'Switch to Try Answer' : 'Switch to Ask'),
            ),
          ],
        ),
      ],
    );
  }
}
