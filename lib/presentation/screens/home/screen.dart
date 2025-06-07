import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/combined_provider/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/single_watch_split_handle/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/split_watch/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/value_or_default/screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  static const String path = '/home';
  static const String name = 'home';

  List<Widget> get _screens => [
        const _ListTile(screenType: _ScreenType.splitWatch),
        const _ListTile(screenType: _ScreenType.singleWatchSplitHandle),
        const _ListTile(screenType: _ScreenType.combinedProvider),
        const _ListTile(screenType: _ScreenType.valueOrDefault),
        const SizedBox.shrink(), // Placeholder for spacing
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ListView.separated(
          itemCount: _screens.length,
          itemBuilder: (context, index) => _screens[index],
          separatorBuilder: (context, index) => const Divider(),
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({required this.screenType});

  final _ScreenType screenType;

  String get _screenName => switch (screenType) {
        _ScreenType.splitWatch => SplitWatchScreen.name,
        _ScreenType.singleWatchSplitHandle => SingleWatchSplitHandleScreen.name,
        _ScreenType.combinedProvider => CombinedProviderScreen.name,
        _ScreenType.valueOrDefault => ValueOrDefaultScreen.name,
      };

  String get _screenPath => switch (screenType) {
        _ScreenType.splitWatch => SplitWatchScreen.path,
        _ScreenType.singleWatchSplitHandle => SingleWatchSplitHandleScreen.path,
        _ScreenType.combinedProvider => CombinedProviderScreen.path,
        _ScreenType.valueOrDefault => ValueOrDefaultScreen.path,
      };

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Go to $_screenName'),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        context.push(_screenPath);
      },
    );
  }
}

enum _ScreenType {
  splitWatch,
  singleWatchSplitHandle,
  combinedProvider,
  valueOrDefault,
}
