import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/environment.dart';

void admobFullScreen() {
  const Map<String, String> UNIT_ID = {
    'ios': Ios_UNIT_ID,
    'android': Android_UNIT_ID,
  };

  String adUnitId = UNIT_ID[Platform.isIOS ? 'ios' : 'android']!;

  InterstitialAd.load(
    adUnitId: adUnitId,
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (ad) {
        ad.fullScreenContentCallback = FullScreenContentCallback(
          onAdDismissedFullScreenContent: (ad) {},
        );
        ad.show();
      },
      onAdFailedToLoad: (err) {
        print('Failed to load an interstitial ad: ${err.message}');
      },
    ),
  );
}
