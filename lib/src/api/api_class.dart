import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VisionCraft {
  // Create image function.
  static Future<void> generateImage() async {}

  // Fetch image function.
  static Future<Uint8List?> fetchImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    } else {
      print("Error fetching image: ${response.statusCode}");
      // Handle error based on the status code
      return null;
    }
  }
}
