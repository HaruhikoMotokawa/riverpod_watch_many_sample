import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/combined_provider/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/cutom_hook/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/home/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/single_watch_split_handle/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/split_watch/screen.dart';
import 'package:riverpod_watch_many_sample/presentation/screens/value_or_default/screen.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) => _goRouter;

final _goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: HomeScreen.path,
  // パスと画面の組み合わせ
  routes: [
    // ---------------- //
    // HomeScreen
    // ---------------- //
    GoRoute(
      path: HomeScreen.path,
      name: HomeScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
    ),
    // ---------------- //
    // SplitWatchScreen
    // ---------------- //
    GoRoute(
      path: SplitWatchScreen.path,
      name: SplitWatchScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SplitWatchScreen(),
        );
      },
    ),
    // ---------------- //
    // SingleWatchSplitHandleScreen
    // ---------------- //
    GoRoute(
      path: SingleWatchSplitHandleScreen.path,
      name: SingleWatchSplitHandleScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const SingleWatchSplitHandleScreen(),
        );
      },
    ),
    // ---------------- //
    // CombinedProviderScreen
    // ---------------- //
    GoRoute(
      path: CombinedProviderScreen.path,
      name: CombinedProviderScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const CombinedProviderScreen(),
        );
      },
    ),
    // ---------------- //
    // ValueOrDefaultScreen
    // ---------------- //
    GoRoute(
      path: ValueOrDefaultScreen.path,
      name: ValueOrDefaultScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const ValueOrDefaultScreen(),
        );
      },
    ),
    // ---------------- //
    // CustomHookScreen
    // ---------------- //
    GoRoute(
      path: CustomHookScreen.path,
      name: CustomHookScreen.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const CustomHookScreen(),
        );
      },
    ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
