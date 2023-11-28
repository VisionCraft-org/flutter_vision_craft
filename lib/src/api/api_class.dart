import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VisionCraft {
  // Create image function.
  static Future<List<String>?> generateImage({
    required String apiKey,
    required String prompt,
    String? negativePrompt,
    String? model,
    String? sampler,
    int? cfgScale,
    int? steps,
    int? imageCount,
  }) async {
    const apiUrl = "https://visioncraftapi--vladalek05.repl.co";

    // [apiKey] get your free api key on https://t.me/VisionCraft_bot by sending /Key.

    const visionCraftUrl = "$apiUrl/generate";

    final visionCraftData = {
      "model": model ?? "anything_V5",
      "sampler": sampler ?? "Euler",
      "prompt": prompt,
      "negative_prompt": negativePrompt ?? "Blur",
      "image_count": imageCount ?? 1,
      "token": apiKey,
      "cfg_scale": cfgScale ?? 8,
      "steps": steps ?? 30,
    };

    // try {
    //   final response = await http.post(
    //     Uri.parse(visionCraftUrl),
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(visionCraftData),
    //   );

    //   // Check if the request was successful (status code 200)
    //   if (response.statusCode == 200) {
    //     // Extract image URL from the response
    //     if (imageCount != null && imageCount != 1) {}
    //     final imageUrl =
    //         List<String>.from(json.decode(response.body)["images"]).first;

    //     // Fetch and return the image as Uint8List
    //     final Uint8List? image = await fetchImage(imageUrl);

    //     return image;
    //   } else {
    //     print("Error generating image: ${response.statusCode}");
    //     // Handle error based on the status code
    //     return null;
    //   }
    // } catch (error) {
    //   print("Error generating image: $error");
    //   // Handle error as needed
    //   return null;
    // }
    try {
      final response = await http.post(
        Uri.parse(visionCraftUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(visionCraftData),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract image URLs from the response
        final List<String> imageUrls =
            List<String>.from(json.decode(response.body)["images"]);

        // If imageCount is not null and not equal to 1, return the list of image URLs
        if (imageCount != null && imageCount != 1) {
          return imageUrls;
        } else {
          // If imageCount is 1 or null, fetch and return the first image as Uint8List
          // final Uint8List? image = await fetchImage(imageUrls.first);
          return [imageUrls.first];
        }
      } else {
        print("Error generating images: ${response.statusCode}");
        // Handle error based on the status code
        return null;
      }
    } catch (error) {
      print("Error generating images: $error");
      // Handle error as needed
      return null;
    }
  }

  // Fetch generated images function.
  static Future<Uint8List?> fetchImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.bodyBytes);
      } else {
        print("Error fetching image: ${response.statusCode}");
        return null;
      }
    } catch (error) {
      print("Error fetching image: $error");
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
