`flutter_vision_craft` package:

# Vision Craft Flutter Package

`flutter_vision_craft` is a Flutter package for interacting with the VisionCraft API, allowing you to generate images, upscale images, perform image-to-image transformations, and more.

# For Premium account

Contact (https://t.me/Metimol)

## Installation

To use this package, add `flutter_vision_craft` as a dependency in your `pubspec.yaml` file.


```yaml
dependencies:
  flutter_vision_craft: ^1.3.3
```

Then run:

```bash
flutter pub get
```

## Usage

Import the package in your Dart file:

```dart
import 'package:flutter_vision_craft/flutter_vision_craft.dart';
```

### Initialize VisionCraft Class


```dart

// Late init Vision Craft class.

 late VisionCraft visionCraft;

 // initialize the vision craft plugin.

 
  @override
  void initState() {
    super.initState();
    visionCraft = VisionCraft(
      // Vision Craft api key from vision craft bot on telegram.
      apiKey: "edf8e8cb---",
      // You can add the baseUrl manually if you want. It's optional.
      // You can use the built in.
      baseUrl: "https://visioncraft.top",
    );
  }

```
#### Generating Images

```dart
Future<Uint8List?> generateImage({
  required String prompt,
  sampler: Samplers.euler,
  model: AIModels.anythingV45,
  watermark: false,
  nsfw_filter: true,
  // ... other optional parameters
}) async {
  // ... implementation details
}
```

#### Using XL Model (PREMIUM) - Contact https://t.me/Metimol

```dart
  Future<void> useXLModel() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.useXLModel(
      apiKey: apiKey,
      enhance: true,
      prompt: prompt,
      nsfwFilter: false,
      model: XLModels.sdxlBase,
      xlResolution: XLResolution.r1x1,
    );
    imageResult = result;
    setState(() {});
  }
```

#### Upscaling Image

```dart
Future<Uint8List> upscaleImage({
  required Uint8List image,
  required String apiKey,
}) async {
  // ... implementation details
}
```

#### Image to Image Transformation

```dart
Future<Uint8List> img2img({
  required Uint8List image,
  required String apiKey,
  // ... other required parameters
}) async {
  // ... implementation details
}
```

#### Text to GIF

#### Returns a string of image url

```dart
Future<String?> text2gif({
  required String apiKey,
  required String prompt,
  // ... other optional parameters
}) async {
  // ... implementation details
}
```

#### Get VisionCraft Model List

```dart
Future<List<String>> getModelList() async {
  // ... implementation details
}
```

#### Get Sampler List

```dart
Future<List<String>> getSamplerList() async {
  // ... implementation details
}
```

## Examples

Here are some examples of using the `flutter_vision_craft` package:

```dart
// These examples can be found in /example folder

// Use XLModels. 

 Future<void> useXLModel() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.useXLModel(
      apiKey: apiKey,
      enhance: true,
      prompt: prompt,
      nsfwFilter: false,
      model: XLModels.animeArtDiffusionXL,
      xlResolution: XLResolution.r1x1,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }

  // Use Normal Models

  Future<void> createImage() async {
    String prompt = controller.text.trim().toString();
    final result = await visionCraft.generateImage(
      apiKey: apiKey,
      prompt: prompt,
      sampler: Samplers.euler,
      model: AIModels.anythingV45,
      watermark: false,
      nsfw_filter: true,
    );
    imageResult = result;
    isLoading = false;
    setState(() {});
  }

  // Get Models List

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

// Get Samplers List

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
```

## Credits

This package is developed by [Karl Mathuthu](https://www.github.com/karlmathuthu/).

Feel free to explore the API documentation for more details on available methods and parameters.

**Note:** Make sure to replace `^1.4.6` with the latest version of the package available.


Feel Free to contact me on Telegram - https//t.me/karlkiyotaka/