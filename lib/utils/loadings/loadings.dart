import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void threeDotLoading(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const RiveAnimation.asset('assets/loading.riv'),
  );
}
