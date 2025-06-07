part of 'screen.dart';

typedef _ScreenState = ({
  MaterialColor red,
  MaterialColor blue,
  MaterialColor yellow,
  bool isRedTileEnabled,
  bool isBlueTileEnabled,
  bool isYellowTileEnabled,
});

_ScreenState _useScreenState(WidgetRef ref) {
  // -------------------- //
  // providerの取得
  // -------------------- //
  final asyncRed = ref.watch(red1SecondsProvider);
  final asyncBlue = ref.watch(blue3SecondsProvider);
  final asyncYellow = ref.watch(yellow5SecondsProvider);

  // -------------------- //
  // AsyncValueから値を取得
  // -------------------- //
  final red = asyncRed.valueOrNull ?? Colors.grey;
  final blue = asyncBlue.valueOrNull ?? Colors.grey;
  final yellow = asyncYellow.valueOrNull ?? Colors.grey;

  final isRedTileEnabled = !asyncRed.isLoading && !asyncRed.hasError;
  final isBlueTileEnabled = !asyncBlue.isLoading && !asyncBlue.hasError;
  final isYellowTileEnabled = !asyncYellow.isLoading && !asyncYellow.hasError;

  // -------------------- //
  // 取得した値を返す
  // -------------------- //
  return (
    red: red,
    blue: blue,
    yellow: yellow,
    isRedTileEnabled: isRedTileEnabled,
    isBlueTileEnabled: isBlueTileEnabled,
    isYellowTileEnabled: isYellowTileEnabled,
  );
}
