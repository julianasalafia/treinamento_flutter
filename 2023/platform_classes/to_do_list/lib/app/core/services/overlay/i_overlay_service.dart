import 'package:flutter/material.dart';

abstract interface class IOverlayService {
  void show({Widget? child});

  Future<void> hide();
  void dispose();
}
