import 'package:flutter_vision_craft/src/utils/enum-class.dart';

class EnumConverter {
  static String getXLModel(XLModels model) {
    switch (model) {
      case XLModels.sdxlBase:
        return "sdxl-base";
      case XLModels.sdxlRefiner:
        return "sdxl-refiner";
      case XLModels.sdxlturbo:
        return "sdxl-turbo";
      case XLModels.juggernautXLV5:
        return "juggernaut-xl-V5";
      case XLModels.dynavisionXl:
        return "dynavision-xl-all-in-one-stylized";
      case XLModels.animeArtDiffusionXL:
        return "anime-art-diffusion-xl";
    }
  }
}

class ModelConverter {
  static String getModel(AIModels model) {
    switch (model) {
      case AIModels.guofeng3V34:
        return "3guofeng3_v3.4";
      case AIModels.absoluterealityV16:
        return "absolutereality_v1.6";
      case AIModels.absoluterealityV181:
        return "absolutereality_v1.8.1";
      case AIModels.amIRealV41:
        return "amIReal_v4.1";
      case AIModels.analogDiffusionV1:
        return "analog_diffusion_v1";
      case AIModels.anythingV30:
        return "anything_v3.0";
      case AIModels.anythingV45:
        return "anything_v4.5";
      case AIModels.anythingV5:
        return "anything_V5";
      case AIModels.abyssOrangemixV3:
        return "abyss_orangemix_v3";
      case AIModels.blazingDriveV10g:
        return "blazing_drive_v10g";
      case AIModels.cetusmixV35:
        return "cetusmix_v35";
      case AIModels.childrensStoriesV13D:
        return "childrensStories_v1_3D";
      case AIModels.childrensStoriesV1SemiReal:
        return "childrensStories_v1_SemiReal";
      case AIModels.childrensStoriesV1ToonAnime:
        return "childrensStories_v1_ToonAnime";
      case AIModels.counterfeitV30:
        return "Counterfeit_v3.0";
      case AIModels.cuteyukimixMidchapter3:
        return "cuteyukimix_midchapter3";
      case AIModels.cyberrealisticV33:
        return "cyberrealistic_v3.3";
      case AIModels.dalcefoV4:
        return "dalcefo_v4";
      case AIModels.deliberateV2:
        return "deliberate_v2";
      case AIModels.deliberateV3:
        return "deliberate_v3";
      case AIModels.dreamlikeAnimeV10:
        return "dreamlike_anime_v1.0";
      case AIModels.dreamlikeDiffusionV10:
        return "dreamlike_diffusion_v1.0";
      case AIModels.dreamlikePhotorealV20:
        return "dreamlike_photoreal_v2.0";
      case AIModels.dreamshaperV6:
        return "dreamshaper_v6";
      case AIModels.dreamshaperV7:
        return "dreamshaper_v7";
      case AIModels.dreamshaperV8:
        return "dreamshaper_v8";
      case AIModels.edgeOfRealismEorV20:
        return "edgeOfRealism_eor_v2.0";
      case AIModels.eimisAnimeDiffusionV1:
        return "EimisAnimeDiffusion_v1";
      case AIModels.elldrethsVivid:
        return "elldreths-vivid";
      case AIModels.epicrealismNaturalSinRC1:
        return "epicrealism_natural_Sin_RC1";
      case AIModels.iCantBelieveItsNotPhotographySeco:
        return "ICantBelieveItsNotPhotography_seco";
      case AIModels.juggernautAftermath:
        return "juggernaut_aftermath";
      case AIModels.lofiV4:
        return "lofi_v4";
      case AIModels.lyrielV16:
        return "lyriel_v1.6";
      case AIModels.majicmixRealisticV4:
        return "majicmixRealistic_v4";
      case AIModels.mechamixV10:
        return "mechamix_v1.0";
      case AIModels.meinamixV9:
        return "meinamix_v9";
      case AIModels.meinamixV11:
        return "meinamix_v11";
      case AIModels.neverendingDreamV122:
        return "neverendingDream_v1.22";
      case AIModels.openjourneyV4:
        return "openjourney_v4";
      case AIModels.pastelMixStylizedAnimePruned:
        return "pastelMixStylizedAnime_pruned";
      case AIModels.portraitplusV10:
        return "portraitplus_v1.0";
      case AIModels.protogenX34:
        return "protogen_x3.4";
      case AIModels.realisticVisionV14:
        return "Realistic_Vision_v1.4";
      case AIModels.realisticVisionV20:
        return "Realistic_Vision_v2.0";
      case AIModels.realisticVisionV40:
        return "Realistic_Vision_v4.0";
      case AIModels.realisticVisionV50:
        return "Realistic_Vision_v5.0";
      case AIModels.redshiftDiffusionV10:
        return "redshift_diffusion_v1.0";
      case AIModels.revAnimatedV122:
        return "revAnimated_v1.2.2";
      case AIModels.rundiffusionFXV25DV10:
        return "rundiffusionFX_v2.5D_v1.0";
      case AIModels.rundiffusionFXPhotorealisticV10:
        return "rundiffusionFX_photorealistic_v1.0";
      case AIModels.stableDiffusionV14:
        return "StableDiffusion_v1.4";
      case AIModels.stableDiffusionV15:
        return "Stable_Diffusion_v1.5";
      case AIModels.stableDiffusionV15Inpainting:
        return "Stable_Diffusion_v1.5_inpainting";
      case AIModels.shoninsBeautifulV10:
        return "shoninsBeautiful_v1.0";
      case AIModels.theallysMixV2:
        return "theallys_mix_v2";
      case AIModels.timelessV10:
        return "timeless_v1.0";
      case AIModels.toonyouBeta6:
        return "toonyou_beta6";
    }
  }
}

class SamplerConverter {
  static String getSampler(Samplers sampler) {
    switch (sampler) {
      case Samplers.euler:
        return "Euler";
      case Samplers.eulerA:
        return "Euler a";
      case Samplers.lms:
        return "LMS";
      case Samplers.heun:
        return "Heun";
      case Samplers.dpm2:
        return "DPM2";
      case Samplers.dpm2A:
        return "DPM2 a";
      case Samplers.dpm2ASa:
        return "DPM++ 2S a";
      case Samplers.dpm2M:
        return "DPM++ 2M";
      case Samplers.dpmSDE:
        return "DPM++ SDE";
      case Samplers.dpmFast:
        return "DPM fast";
      case Samplers.dpmAdaptive:
        return "DPM adaptive";
      case Samplers.lmsKarras:
        return "LMS Karras";
      case Samplers.dpm2Karras:
        return "DPM2 Karras";
      case Samplers.dpm2AKarras:
        return "DPM2 a Karras";
      case Samplers.dpm2ASaKarras:
        return "DPM++ 2S a Karras";
      case Samplers.dpm2MKarras:
        return "DPM++ 2M Karras";
      case Samplers.dpmSDEKarras:
        return "DPM++ SDE Karras";
      case Samplers.ddim:
        return "DDIM";
      case Samplers.plms:
        return "PLMS";
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
