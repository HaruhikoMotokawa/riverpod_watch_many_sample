import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'red_1_seconds.g.dart';

@riverpod
Future<MaterialColor> red1Seconds(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 1));
  return Colors.red;
}
