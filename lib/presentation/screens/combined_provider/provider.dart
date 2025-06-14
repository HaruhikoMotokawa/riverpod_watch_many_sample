import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_3_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_5_seconds.dart';

part 'provider.g.dart';

typedef CombinedProviderScreenState = ({
  MaterialColor red,
  MaterialColor blue,
  MaterialColor yellow,
});

@riverpod
Future<CombinedProviderScreenState> combinedProviderScreenState(Ref ref) async {
  final (red, blue, yellow) = await (
    ref.watch(red1SecondsProvider.future),
    ref.watch(blue3SecondsProvider.future),
    ref.watch(yellow5SecondsProvider.future),
  ).wait;

  return (
    red: red,
    blue: blue,
    yellow: yellow,
  );
}
