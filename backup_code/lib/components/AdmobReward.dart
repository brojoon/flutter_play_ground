import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/environment.dart';

class AdmobReward extends StatefulWidget {
  const AdmobReward({super.key});

  @override
  State<AdmobReward> createState() => _AdmobRewardState();
}

class _AdmobRewardState extends State<AdmobReward> {
  RewardedAd? _rewardedAd;

  static const Map<String, String> UNIT_ID = kReleaseMode
      ? {
          'ios': Ios_UNIT_ID,
          'android': Android_UNIT_ID,
        }
      : {
          'ios': Ios_UNIT_ID,
          'android': Android_UNIT_ID,
        };

  String adUnitId = UNIT_ID[Platform.isIOS ? 'ios' : 'android']!;

  void _loadRewardedAd() {
    RewardedAd.load(
      adUnitId: adUnitId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              setState(() {
                ad.dispose();
                _rewardedAd = null;
              });
              _loadRewardedAd();
            },
          );

          setState(() {
            _rewardedAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadRewardedAd();
  }

  @override
  void dispose() {
    _rewardedAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
