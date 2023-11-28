import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VisionCraft {
  // Create image function.
  static Future<void> generateImage() async {}

  // Fetch generated image function.
  static Future<Uint8List?> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    } else {
      print("Error fetching image: ${response.statusCode}");
      return null;
    }
  }

  // Get VisionCraft model List.
  static Future<List<String>> getModelList() async {
    const apiUrl = "https://visioncraftapi--vladalek05.repl.co/models";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract and return the list of models
        final List<String> models =
            List<String>.from(json.decode(response.body));
        return models;
      } else {
        print("Error fetching models: ${response.statusCode}");
        return [];
      }
    } catch (error) {
      print("Error fetching models: $error");
      return [];
    }
  }
}
