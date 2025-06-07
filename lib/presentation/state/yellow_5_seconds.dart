import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'yellow_5_seconds.g.dart';

@riverpod
Future<MaterialColor> yellow5Seconds(Ref ref) async {
  await Future<void>.delayed(const Duration(seconds: 5));
  return Colors.yellow;
}
