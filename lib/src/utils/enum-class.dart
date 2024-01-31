enum XLModels {
  sdxlBase,
  sdxlRefiner,
  sdxlturbo,
  juggernautXLV5,
  dynavisionXl,
  animeArtDiffusionXL,
}

enum AIModels {
  guofeng3V34,
  absoluterealityV16,
  absoluterealityV181,
  amIRealV41,
  analogDiffusionV1,
  anythingV30,
  anythingV45,
  anythingV5,
  abyssOrangemixV3,
  blazingDriveV10g,
  cetusmixV35,
  childrensStoriesV13D,
  childrensStoriesV1SemiReal,
  childrensStoriesV1ToonAnime,
  counterfeitV30,
  cuteyukimixMidchapter3,
  cyberrealisticV33,
  dalcefoV4,
  deliberateV2,
  deliberateV3,
  dreamlikeAnimeV10,
  dreamlikeDiffusionV10,
  dreamlikePhotorealV20,
  dreamshaperV6,
  dreamshaperV7,
  dreamshaperV8,
  edgeOfRealismEorV20,
  eimisAnimeDiffusionV1,
  elldrethsVivid,
  epicrealismNaturalSinRC1,
  iCantBelieveItsNotPhotographySeco,
  juggernautAftermath,
  lofiV4,
  lyrielV16,
  majicmixRealisticV4,
  mechamixV10,
  meinamixV9,
  meinamixV11,
  neverendingDreamV122,
  openjourneyV4,
  pastelMixStylizedAnimePruned,
  portraitplusV10,
  protogenX34,
  realisticVisionV14,
  realisticVisionV20,
  realisticVisionV40,
  realisticVisionV50,
  redshiftDiffusionV10,
  revAnimatedV122,
  rundiffusionFXV25DV10,
  rundiffusionFXPhotorealisticV10,
  stableDiffusionV14,
  stableDiffusionV15,
  stableDiffusionV15Inpainting,
  shoninsBeautifulV10,
  theallysMixV2,
  timelessV10,
  toonyouBeta6,
}

enum Samplers {
  euler,
  eulerA,
  lms,
  heun,
  dpm2,
  dpm2A,
  dpm2ASa,
  dpm2M,
  dpmSDE,
  dpmFast,
  dpmAdaptive,
  lmsKarras,
  dpm2Karras,
  dpm2AKarras,
  dpm2ASaKarras,
  dpm2MKarras,
  dpmSDEKarras,
  ddim,
  plms,
}

enum XLResolution {
  ///1024 x 1024
  r1x1,

  ///1024 x 576.
  r16x9,

  ///576 x 1024.
  r9x16,

  ///1024 x 680.
  r3x2,

  ///680 x 1024.
  r2x3
}
