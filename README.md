# VisionCraft Flutter Package

A Flutter package for interacting with the VisionCraft API for image generation.

## Getting Started

To use this package, add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_vision_craft: ^latest
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

## Documentaion

Refer to the "https://visioncraftapi.vladalek05.repl.co/docs" for more details on available models, samplers, and API usage.

## Issues and Contributions

If you encounter any issues or have suggestions for improvements, feel free to open an issue or create a pull request.

## License

```license
BSD 3-Clause License

Copyright (c) 2023 Karl Mathuthu
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```