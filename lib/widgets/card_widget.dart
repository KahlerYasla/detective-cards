import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String riddle;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;

  const CardWidget({
    Key? key,
    required this.riddle,
    required this.onSwipeLeft,
    required this.onSwipeRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              riddle,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: onSwipeLeft,
                child: Icon(Icons.thumb_down),
              ),
              ElevatedButton(
                onPressed: onSwipeRight,
                child: Icon(Icons.thumb_up),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
