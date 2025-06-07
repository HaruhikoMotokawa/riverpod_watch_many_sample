import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_watch_many_sample/presentation/shared/color_list_tile.dart';
import 'package:riverpod_watch_many_sample/presentation/state/blue_3_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/red_1_seconds.dart';
import 'package:riverpod_watch_many_sample/presentation/state/yellow_5_seconds.dart';

class SplitWatchScreen extends StatelessWidget {
  const SplitWatchScreen({super.key});

  static const String path = '/split_watch';
  static const String name = 'SplitWatchScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(name),
      ),
      body: Center(
          child: Column(
        spacing: 20,
        children: [
          Consumer(builder: (context, ref, child) {
            final asyncRed = ref.watch(red1SecondsProvider);
            return switch (asyncRed) {
              AsyncData(value: final red) => ColorListTile(color: red),
              AsyncError() => const Text('Error occurred while fetching color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            };
          }),
          Consumer(builder: (context, ref, child) {
            final asyncBlue = ref.watch(blue3SecondsProvider);
            return switch (asyncBlue) {
              AsyncData(value: final blue) => ColorListTile(color: blue),
              AsyncError() => const Text('Error occurred while fetching color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            };
          }),
          Consumer(builder: (context, ref, child) {
            final asyncYellow = ref.watch(yellow5SecondsProvider);
            return switch (asyncYellow) {
              AsyncData(value: final yellow) => ColorListTile(color: yellow),
              AsyncError() => const Text('Error occurred while fetching color'),
              _ => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 2),
                  child: CircularProgressIndicator(),
                ),
            };
          }),
        ],
      )),
    );
  }
}
