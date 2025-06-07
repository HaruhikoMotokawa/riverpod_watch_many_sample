import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yellow_10_seconds.g.dart';

@riverpod
Future<MaterialColor> yellow10Seconds(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 10));
  return Colors.yellow;
}
