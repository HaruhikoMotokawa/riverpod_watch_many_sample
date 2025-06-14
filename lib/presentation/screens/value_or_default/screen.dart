import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_watch_many_sample/presentation/shared/color_list_tile.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_3_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_5_seconds.dart';

class ValueOrDefaultScreen extends ConsumerWidget {
  const ValueOrDefaultScreen({super.key});

  static const String path = '/value_or_default';
  static const String name = 'ValueOrDefaultScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRed = ref.watch(red1SecondsProvider);
    final asyncBlue = ref.watch(blue3SecondsProvider);
    final asyncYellow = ref.watch(yellow5SecondsProvider);

    final red = asyncRed.valueOrNull ?? Colors.grey;
    final blue = asyncBlue.valueOrNull ?? Colors.grey;
    final yellow = asyncYellow.valueOrNull ?? Colors.grey;

    final isRedTileEnabled = !asyncRed.isLoading && !asyncRed.hasError;
    final isBlueTileEnabled = !asyncBlue.isLoading && !asyncBlue.hasError;
    final isYellowTileEnabled = !asyncYellow.isLoading && !asyncYellow.hasError;

    return Scaffold(
        appBar: AppBar(
          title: const Text(name),
        ),
        body: Center(
          child: Column(
            spacing: 20,
            children: [
              ColorListTile(
                color: red,
                enabled: isRedTileEnabled,
              ),
              ColorListTile(
                color: blue,
                enabled: isBlueTileEnabled,
              ),
              ColorListTile(
                color: yellow,
                enabled: isYellowTileEnabled,
              ),
            ],
          ),
        ));
  }
}
