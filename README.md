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
