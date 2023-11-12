import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'i_overlay_service.dart';

class AsukaOverlayService implements IOverlayService {
  OverlayEntry? _entry;

  @override
  void dispose() {
    hide();
  }

  @override
  Future<void> hide() async {
    if (_entry == null) return;

    _entry!.remove();
    _entry = null;

    await Future.delayed(const Duration(milliseconds: 200));
  }

  @override
  void show({Widget? child}) {
    _entry = OverlayEntry(builder: (context) {
      return Container(
        color: Colors.black.withOpacity(0.3),
        alignment: Alignment.center,
        child: child ?? const CircularProgressIndicator(),
      );
    });
    Asuka.addOverlay(_entry!);
  }
}
