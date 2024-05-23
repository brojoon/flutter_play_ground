import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/environment.dart';

class AdmobBanner extends StatefulWidget {
  const AdmobBanner({super.key});

  @override
  State<AdmobBanner> createState() => _AdmobBannerState();
}

class _AdmobBannerState extends State<AdmobBanner> {
  // kReleaseMode
  static const Map<String, String> UNIT_ID = {
    'ios': Ios_UNIT_ID,
    'android': Android_UNIT_ID,
  };

  String adUnitId = UNIT_ID[Platform.isIOS ? 'ios' : 'android']!;

  BannerAd? _bannerAd;

  @override
  void initState() {
    BannerAd(
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdFailedToLoad: (Ad ad, LoadAdError error) {},
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
      ),
      size: AdSize.banner,
      request: const AdRequest(),
    ).load();

    super.initState();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_bannerAd != null) {
      return Container(
          color: Colors.white,
          child: SizedBox(
            width: _bannerAd!.size.width.toDouble(),
            height: _bannerAd!.size.height.toDouble(),
            child: AdWidget(ad: _bannerAd!),
          ));
    } else
      return Container();
  }
}
