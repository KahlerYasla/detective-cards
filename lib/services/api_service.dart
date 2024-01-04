import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String _baseUrl =
      'https://your-backend-url.com'; // Replace with your backend URL

  Future<void> saveLikedCard(String cardId) async {
    try {
      final response = await http.post(
        Uri.parse(
            '$_baseUrl/save-liked-card'), // Replace with the actual endpoint for saving liked cards
        headers: {
          'Content-Type': 'application/json',
          // Add other headers as needed
        },
        body: jsonEncode({'cardId': cardId}),
      );

      if (response.statusCode == 200) {
        print('Liked card saved successfully');
      } else {
        print('Failed to save liked card. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (error) {
      print('Error while saving liked card: $error');
    }
  }
}
