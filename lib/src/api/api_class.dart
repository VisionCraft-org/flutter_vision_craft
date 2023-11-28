// Vision Craft AI flutter package by Karl Kiyotaka.

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VisionCraft {
  // Create image function.
  Future<Uint8List?> generateImage({
    required String apiKey,
    required String prompt,
    required bool enableBadWords,
    String? negativePrompt,
    String? model,
    String? sampler,
    int? cfgScale,
    int? steps,
  }) async {
    const apiUrl = "https://visioncraftapi--vladalek05.repl.co";

    const visionCraftUrl = "$apiUrl/generate";

    final visionCraftData = {
      "model": model ?? "ICantBelieveItsNotPhotography_seco",
      "sampler": sampler ?? "Euler",
      "prompt": prompt,
      "negative_prompt": negativePrompt ?? "Blur",
      "image_count": 1,
      "token": apiKey,
      "cfg_scale": cfgScale ?? 8,
      "steps": steps ?? 30,
    };

    try {
      final response = await http.post(
        Uri.parse(visionCraftUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(visionCraftData),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract image URL from the response
        final imageUrl =
            List<String>.from(json.decode(response.body)["images"]).first;

        // Fetch and return the image as Uint8List
        final Uint8List? image = await fetchImage(imageUrl);

        return image;
      } else {
        print("Error generating image: ${response.statusCode}");
        // Handle error based on the status code
        return null;
      }
    } catch (error) {
      print("Error generating image: $error");
      // Handle error as needed
      return null;
    }
  }

  // Fetch generated images function.
  Future<Uint8List?> fetchImage(String imageUrl) async {
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
  Future<List<String>> getModelList() async {
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

  // Get all the available samplers.
  Future<List<String>> getSamplerList() async {
    const apiUrl = "https://visioncraftapi--vladalek05.repl.co/samplers";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract and return the list of samplers
        final List<String> samplers =
            List<String>.from(json.decode(response.body));
        return samplers;
      } else {
        print("Error fetching samplers: ${response.statusCode}");
        // Handle error based on the status code
        return [];
      }
    } catch (error) {
      print("Error fetching samplers: $error");
      // Handle error as needed
      return [];
    }
  }
}
