import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_vision_craft/flutter_vision_craft.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vision Craft Example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

/// Example of image generation [HomePage]

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  late VisionCraft visionCraft;
  Uint8List? imageResult;
  bool? isLoading;

  /// [apiKey] get your free api key on https://t.me/VisionCraft_bot by sending /Key.
  String apiKey = "edf8e8cb---";

  Future<void> useXLModel() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.useXLModel(
      enhance: true,
      prompt: prompt,
      aiStyle: AIStyles.anime,
      nsfwFilter: false,
      model: XLModels.animeArtDiffusionXL,
      xlResolution: XLResolution.r1x1,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }

  Future<void> createImage() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.generateImage(
      prompt: prompt,
      aiStyle: AIStyles.cyberpunk,
      sampler: Samplers.euler,
      model: AIModels.anythingV45,
      watermark: false,
      nsfw_filter: true,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    visionCraft = VisionCraft(
      apiKey: apiKey,
      baseUrl: "https://visioncraft.top",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Vision Craft Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading != null && isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // TextField for prompt
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        width: 0.5,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: 'Enter query text...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 8),
                      ),
                    ),
                  ),
                  // Image result.
                  imageResult == null
                      ? const Center(
                          child: Text("Enter prompt to create image"),
                        )
                      : Image.memory(imageResult!),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          isLoading = true;
          setState(() {});
          useXLModel();
        },
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }
}
