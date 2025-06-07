import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_3_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_10_seconds.dart';

part 'provider.g.dart';

typedef CombinedProviderScreenState = ({
  MaterialColor red,
  MaterialColor blue,
  MaterialColor yellow,
});

@riverpod
Future<CombinedProviderScreenState> combinedProviderScreenState(Ref ref) async {
  final red = await ref.watch(red1SecondsProvider.future);
  final blue = await ref.watch(blue3SecondsProvider.future);
  final yellow = await ref.watch(yellow10SecondsProvider.future);

  return (
    red: red,
    blue: blue,
    yellow: yellow,
  );
}
