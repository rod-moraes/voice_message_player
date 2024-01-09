import 'package:flutter/material.dart';

/// Get screen media.
final MediaQueryData media =
    // ignore: deprecated_member_use
    MediaQueryData.fromWindow(WidgetsBinding.instance.window);

/// This extention help us to make widget responsive.
extension NumberParsing on num {
  double w() => this * media.size.width / 100;

  double h() => this * media.size.height / 100;
}

///
extension StringExtension on String {
  String? get appendZeroPrefix {
    return length <= 1 ? "0$this" : this;
  }
}

/// This extention help us to make widget responsive.
extension DurationExtension on Duration {
  String get formattedTime {
    final minDur = inMinutes;
    final secDur = ((inMilliseconds % 6000) / 1000).ceil();
    String min = minDur < 10 ? "0$minDur" : minDur.toString();
    String sec = secDur < 10 ? "0$secDur" : secDur.toString();
    return "$min:$sec";
  }

  String get formattedTimeFloor {
    int sec = inSeconds % 60;
    int min = (inSeconds / 60).floor();
    return "${min.toString().appendZeroPrefix}:${sec.toString().appendZeroPrefix}";
  }
}
