import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_watch_many_sample/presentation/shared/color_list_tile.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_5_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_10_seconds.dart';

part '_use_screen_state.dart';

class CustomHookScreen extends ConsumerWidget {
  const CustomHookScreen({super.key});

  static const String path = '/custom_hook';
  static const String name = 'CustomHookScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenState = _useScreenState(ref);

    return Scaffold(
      appBar: AppBar(
        title: const Text(name),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            ColorListTile(
              color: screenState.red,
              enabled: screenState.isRedTileEnabled,
            ),
            ColorListTile(
              color: screenState.blue,
              enabled: screenState.isBlueTileEnabled,
            ),
            ColorListTile(
              color: screenState.yellow,
              enabled: screenState.isYellowTileEnabled,
            ),
          ],
        ),
      ),
    );
  }
}
