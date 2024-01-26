import 'package:flutter_vision_craft/src/utils/enum-class.dart';

class ModelConverter {
  static String getXLModel(XLModels model) {
    switch (model) {
      case XLModels.deliberateV3:
        return "deliberate-v3";
      case XLModels.dreamshaperV8:
        return "dreamshaper-v8";
      case XLModels.swizz8:
        return "swizz8";
      case XLModels.juggernautXL:
        return "juggernaut-xl";
      case XLModels.sdxlBase:
        return "sdxl-base";
      case XLModels.sdxlRefiner:
        return "sdxl-refiner";
      case XLModels.sdxlTurbo:
        return "sdxl-turbo";
      case XLModels.juggernautXLV5:
        return "juggernaut-xl-V5";
      case XLModels.dynavisionXL:
        return "dynavision-xl-all-in-one-stylized";
      case XLModels.animeArtDiffusionXL:
        return "anime-art-diffusion-xl";
    }
  }
}

class ResolutionConverter {
  static String getResolution(Resolutions resolution) {
    switch (resolution) {
      case Resolutions.r1x1:
        return "1024x1024";
      case Resolutions.r16x9:
        return "1024x576";
      case Resolutions.r9x16:
        return "576x1024";
      case Resolutions.r3x2:
        return "1024x680";
      case Resolutions.r2x3:
        return "680x1024";
    }
  }
}
