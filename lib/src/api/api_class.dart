/// vision Craft AI flutter package by @Karlmathuthu.

import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class VisionCraft {
  // Create image.
  Future<Uint8List?> generateImage({
    required String apiKey,
    required String prompt,
    bool? nsfw_filter,
    Map<String, dynamic>? loras,
    bool? watermark,
    String? negativePrompt,
    String? model,
    String? sampler,
    int? cfgScale,
    int? steps,
  }) async {
    const url = 'https://visioncraft-rs24.koyeb.app/generate';

    final requestBody = {
      "model": model ?? "anything_V5",
      "sampler": sampler ?? "Euler",
      "prompt": prompt,
      "negative_prompt": negativePrompt ?? "Blur",
      "image_count": 1,
      "token": apiKey,
      "cfg_scale": cfgScale ?? 8,
      "steps": steps ?? 30,
      // "watermark": watermark, // Removed becuase it caused invalid requests (422)
      "loras": loras ?? {},
      "nsfw_filter": nsfw_filter ?? false,
    };

    try {
      final headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(requestBody),
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
        throw "Error generating image: ${response.statusCode}";
        // print("Error generating image: ${response.statusCode}");
        // return null;
      }
    } catch (error) {
      throw "Error generating image: $error";
      // print("Error generating image: $error");
      // return null;
    }
  }

  // Fetch generated images.
  Future<Uint8List?> fetchImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));

      if (response.statusCode == 200) {
        return Uint8List.fromList(response.bodyBytes);
      } else {
        throw "Error fetching image: ${response.statusCode}";
        // print("Error fetching image: ${response.statusCode}");
        // return null;
      }
    } catch (error) {
      throw "Error fetching image: $error";
      // print("Error fetching image: $error");
      // return null;
    }
  }

  // Upscale Image.
  Future<Uint8List> upscaleImage({
    required Uint8List image,
    required String apiKey,
  }) async {
    try {
      // Encode image bytes to base64
      String imageBase64 = base64Encode(image);

      // Prepare payload
      Map<String, String> payload = {
        "token": apiKey,
        "image": imageBase64,
      };

      // API endpoint URL
      String url = 'https://visioncraft-rs24.koyeb.app/beta/upscale';

      // Set headers
      Map<String, String> headers = {
        "content-type": "application/json",
      };

      // Make HTTP POST request
      var response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(payload));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Return the upscaled image as Uint8List
        return Uint8List.fromList(response.bodyBytes);
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Get VisionCraft model List.
  Future<List<String>> getModelList() async {
    const apiUrl = "https://visioncraft-rs24.koyeb.app/models";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract and return the list of models
        final List<String> models =
            List<String>.from(json.decode(response.body));
        return models;
      } else {
        throw "Error fetching models: ${response.statusCode}";
        // print("Error fetching models: ${response.statusCode}");
        // return [];
      }
    } catch (error) {
      throw "Error fetching models: $error";
      // print("Error fetching models: $error");
      // return [];
    }
  }

  // Get all the available samplers.
  Future<List<String>> getSamplerList() async {
    const apiUrl = "https://visioncraft-rs24.koyeb.app/samplers";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Extract and return the list of samplers
        final List<String> samplers =
            List<String>.from(json.decode(response.body));
        return samplers;
      } else {
        throw "Error fetching samplers: ${response.statusCode}";
        // print("Error fetching samplers: ${response.statusCode}");
        // return [];
      }
    } catch (error) {
      throw "Error fetching samplers: $error";
      // print("Error fetching samplers: $error");
      // return [];
    }
  }
}
