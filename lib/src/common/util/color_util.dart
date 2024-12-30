import 'dart:math';

import 'package:flutter/material.dart';

String generateColor() {
  return Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
      .withOpacity(1)
      .value
      .toString();
}
