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
  final VisionCraft visionCraft = VisionCraft();
  Uint8List? imageResult;
  bool? isLoading;

  /// [apiKey] get your free api key on https://t.me/VisionCraft_bot by sending /Key.
  String apiKey = "f14eb9f4---";

  Future<void> useXLModel() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.useXLModel(
      apiKey: apiKey,
      enhance: true,
      prompt: prompt,
      aiStyle: AIStyles.cartoon,
      nsfwFilter: false,
      model: XLModels.juggernautXLV7,
      xlResolution: XLResolution.r1x1,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }

  Future<void> createImage() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.generateImage(
      apiKey: apiKey,
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
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Get Model List"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Get Samplers List"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GetAvailableSamplers(),
                ),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const GetAllSamplersExapmle(),
                ),
              );
            }
          }),
        ],
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
          createImage();
        },
        child: const Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Example of getting models [GetAvailableSamplers]
class GetAvailableSamplers extends StatefulWidget {
  const GetAvailableSamplers({super.key});

  @override
  State<GetAvailableSamplers> createState() => _GetAvailableSamplersState();
}

class _GetAvailableSamplersState extends State<GetAvailableSamplers> {
  List<String> models = [];
  final VisionCraft visionCraft = VisionCraft();

  Future<void> getModelList() async {
    final result = await visionCraft.getModelList();
    models = result;

    /// Print Models.
    for (int i = 0; i < result.length; i++) {
      print(result[i]);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getModelList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'GetModels Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: models.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              itemCount: models.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(models[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          /// Refresh
          models.clear();
          getModelList();
          setState(() {});
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Example of gettings available samplers
class GetAllSamplersExapmle extends StatefulWidget {
  const GetAllSamplersExapmle({super.key});

  @override
  State<GetAllSamplersExapmle> createState() => _GetAllSamplersExapmleState();
}

class _GetAllSamplersExapmleState extends State<GetAllSamplersExapmle> {
  List<String> samplers = [];
  final VisionCraft visionCraft = VisionCraft();

  Future<void> getSamplersList() async {
    final result = await visionCraft.getSamplerList();
    samplers = result;

    /// Print Models.
    for (int i = 0; i < result.length; i++) {
      print(result[i]);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getSamplersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'GetSamplers Example',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: samplers.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            )
          : ListView.builder(
              itemCount: samplers.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(samplers[index]),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          /// Refresh
          samplers.clear();
          getSamplersList();
          setState(() {});
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
    );
  }
}
