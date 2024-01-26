import 'package:flutter_vision_craft/src/utils/enum-class.dart';

class EnumConverter {
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
  static (String, String) getResolution(XLResolution resolution) {
    switch (resolution) {
      case XLResolution.r1x1:
        return ("1024", "1024");
      case XLResolution.r16x9:
        return ("1024", "576");
      case XLResolution.r9x16:
        return ("576", "1024");
      case XLResolution.r3x2:
        return ("1024", "680");
      case XLResolution.r2x3:
        return ("680", "1024");
    }
  }
}
