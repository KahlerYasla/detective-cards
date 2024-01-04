import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:detective_cards/widgets/card_widget.dart';
import 'package:detective_cards/widgets/textfield_widget.dart';
import 'package:detective_cards/widgets/tab_buttons.dart';
import 'package:detective_cards/providers/gpt_provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detective Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gptService = ref.watch(gptProvider);

    // Dummy data for demonstration
    final detectiveCard = "Who is the murderer?";

    return Scaffold(
      appBar: AppBar(
        title: Text('Detective Cards'),
      ),
      body: Column(
        children: [
          CardWidget(
            riddle: detectiveCard,
            onSwipeLeft: () {
              // Handle swipe left (dislike) logic
              print('Swiped Left');
            },
            onSwipeRight: () {
              // Handle swipe right (like) logic
              print('Swiped Right');
            },
          ),
          TextFieldWidget(
            onAskQuestion: (question) async {
              final response = await gptService.askQuestion(question);
              // Handle the response from the GPT API for questions
              print('Response from GPT for question: $response');
            },
            onTryAnswer: (answer) async {
              final response = await gptService.tryAnswer(answer);
              // Handle the response from the GPT API for answers
              print('Response from GPT for answer: $response');
            },
          ),
          TabButtons(
            isAskingQuestion: true, // Change to the actual state or variable
            onSwitchToAsk: () {
              // Handle switching to ask mode
              print('Switching to Ask Question mode');
            },
            onSwitchToTryAnswer: () {
              // Handle switching to try answer mode
              print('Switching to Try Answer mode');
            },
          ),
        ],
      ),
    );
  }
}
