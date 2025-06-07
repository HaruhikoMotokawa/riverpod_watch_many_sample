import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/combined_provider/provider.dart';
import 'package:riverpod_watch_many_sample/presentation/shared/color_list_tile.dart';

class CombinedProviderScreen extends ConsumerWidget {
  const CombinedProviderScreen({super.key});

  static const String path = '/combined_provider';
  static const String name = 'CombinedProviderScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(combinedProviderScreenStateProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(name),
        ),
        body: Center(
          child: switch (asyncState) {
            AsyncData(value: final state) => Column(
                spacing: 20,
                children: [
                  ColorListTile(color: state.red),
                  ColorListTile(color: state.blue),
                  ColorListTile(color: state.yellow),
                ],
              ),
            AsyncError() => const Text('Error occurred while fetching data'),
            _ => const CircularProgressIndicator(),
          },
        ));
  }
}
