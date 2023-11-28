# VisionCraft Flutter Package

A Flutter package for interacting with the VisionCraft API for image generation.

## Getting Started

To use this package, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  vision_craft: ^latest
  ```
Then, run ```flutter pub get``` to install the package.

### Example to generate image

To obtain your free api key, go to https://t.me/VisionCraft_bot then send /Key.

```dart
final VisionCraft visionCraft = VisionCraft();
  Uint8List? imageResult;
  bool? isLoading;

  /// [apiKey] get your free api key on https://t.me/VisionCraft_bot by sending /Key.
  String apiKey = "f14eb9f4----";

  Future<void> createImage() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.generateImage(
      apiKey: apiKey,
      prompt: prompt,
      enableBadWords: false,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }
```

### Example to get the models List.

```dart
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
```

### Example to get samplers List.

```dart
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
```