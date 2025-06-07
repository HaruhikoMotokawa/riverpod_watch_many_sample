import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_watch_many_sample/presentation/shared/color_list_tile.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_3_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_5_seconds.dart';

class SingleWatchSplitHandleScreen extends ConsumerWidget {
  const SingleWatchSplitHandleScreen({super.key});

  static const String path = '/single_watch_split_handle';
  static const String name = 'SingleWatchSplitHandleScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRed = ref.watch(red1SecondsProvider);
    final asyncBlue = ref.watch(blue3SecondsProvider);
    final asyncYellow = ref.watch(yellow5SecondsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(name),
      ),
      body: Center(
        child: Column(
          spacing: 20,
          children: [
            switch (asyncRed) {
              AsyncData(value: final red) => ColorListTile(color: red),
              AsyncError() =>
                const Text('Error occurred while fetching red color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            },
            switch (asyncBlue) {
              AsyncData(value: final blue) => ColorListTile(color: blue),
              AsyncError() =>
                const Text('Error occurred while fetching blue color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            },
            switch (asyncYellow) {
              AsyncData(value: final yellow) => ColorListTile(color: yellow),
              AsyncError() =>
                const Text('Error occurred while fetching yellow color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            },
          ],
        ),
      ),
    );
  }
}
