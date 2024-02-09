// vision Craft flutter package by https://www.github.com/karlmathuthu/

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_vision_craft/src/utils/enum-class.dart';
import 'package:flutter_vision_craft/src/utils/enum-convertor.dart';
import 'package:http/http.dart' as http;

String apiUrl = "https://visioncraft-rs24.koyeb.app";

// String apiUrl = "https://perfect-foal-tweed-jacket.cyclic.app";

class VisionCraft {
  // Create image.
  Future<Uint8List?> generateImage({
    required String apiKey,
    required String prompt,
    bool? nsfw_filter,
    Map<String, dynamic>? loras,
    bool? watermark,
    String? negativePrompt,
    AIModels? model,
    Samplers? sampler,
    int? cfgScale,
    int? steps,
  }) async {
    var url = '$apiUrl/generate';

    final requestBody = {
      "model": ModelConverter.getModel(model ?? AIModels.anythingV5),
      "sampler": SamplerConverter.getSampler(sampler ?? Samplers.euler),
      "prompt": prompt,
      "negative_prompt": negativePrompt ?? "Blur",
      "image_count": 1,
      "token": apiKey,
      "cfg_scale": cfgScale ?? 8,
      "steps": steps ?? 30,
      "watermark": watermark ?? false,
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
      }
    } catch (error) {
      throw "Error generating image: $error";
    }
  }

  // PREMIUM

  // Use XL model
  Future<Uint8List?> useXLModel({
    required String apiKey,
    required String prompt,
    required XLResolution xlResolution,
    bool? watermark,
    bool? nsfwFilter,
    String? negativePrompt,
    XLModels? model,
    bool? enhance,
  }) async {
    var url = '$apiUrl/generate-xl';

    final requestBody = {
      "model": EnumConverter.getXLModel(model ?? XLModels.sdxlBase),
      "prompt": prompt,
      "negative_prompt": negativePrompt ?? "bad quality",
      "token": apiKey,
      "height": ResolutionConverter.getResolution(xlResolution).$1,
      "width": ResolutionConverter.getResolution(xlResolution).$2,
      "nsfw_filter": nsfwFilter ?? false,
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
        return response.bodyBytes;
      } else if (response.statusCode == 413) {
        throw "Subscribe to premium with only \$5";
      } else {
        throw "Error generating image: ${response.statusCode}";
      }
    } catch (error) {
      print(error);
      // throw "Error generating image: $error";
    }
    return null;
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
      String url = '$apiUrl/beta/upscale';

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

  // Image to Image
  Future<Uint8List> img2img({
    required Uint8List image,
    required String apiKey,
    required String prompt,
    required double strength,
    int? steps,
  }) async {
    String imageBase64 = base64Encode(image);

    String url = "$apiUrl/img2img";

    Map<String, String> headers = {
      "content-type": "application/json",
    };
    final payload = {
      "prompt": prompt,
      "token": apiKey,
      "steps": steps ?? 30,
      "image": imageBase64,
      "strength": strength,
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
  }

  // Text to GIF.

  Future<String?> text2gif({
    required String apiKey,
    required String prompt,
    String? negativePrompt,
    int? steps,
    int? cfgScale,
    Samplers? sampler,
  }) async {
    var url = "$apiUrl/generate-gif";

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
    };

    Map<String, dynamic> data = {
      "sampler": SamplerConverter.getSampler(sampler ?? Samplers.euler),
      "prompt": prompt,
      "negative_prompt": negativePrompt ??
          "canvas frame, cartoon, 3d, ((disfigured)), ((bad art)), ((deformed)),((extra limbs)),((close up)),((b&w)), weird colors, blurry, (((duplicate))), ((morbid)), ((mutilated)), [out of frame], extra fingers, mutated hands, ((poorly drawn hands)), ((poorly drawn face)), (((mutation))), (((deformed))), ((ugly)), blurry, ((bad anatomy)), (((bad proportions))), ((extra limbs)), cloned face, (((disfigured))), out of frame, ugly, extra limbs, (bad anatomy), gross proportions, (malformed limbs), ((missing arms)), ((missing legs)), (((extra arms))), (((extra legs))), mutated hands, (fused fingers), (too many fingers), (((long neck))), Photoshop, video game, ugly, tiling, poorly drawn hands, poorly drawn feet, poorly drawn face, out of frame, mutation, mutated, extra limbs, extra legs, extra arms, disfigured, deformed, cross-eye, body out of frame, blurry, bad art, bad anatomy, 3d render",
      "token": apiKey,
      "cfg_scale": cfgScale ?? 8,
      "steps": steps ?? 30,
    };

    // Send the request to generate images
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      // Extract the image URL from the response
      String imageUrl = json.decode(response.body)["images"][0];
      return imageUrl;
    } else {
      throw "Failed to generate GIF. Status code: ${response.statusCode}";
    }
  }

  // Get VisionCraft model List.
  Future<List<String>> getModelList() async {
    var url = "$apiUrl/models";

    try {
      final response = await http.get(Uri.parse(url));

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
    var url = "$apiUrl/samplers";

    try {
      final response = await http.get(Uri.parse(url));

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

// Credits https://www.github.com/karlmathuthu/