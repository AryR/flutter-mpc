import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff725c00),
      surfaceTint: Color(0xff725c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffd102),
      onPrimaryContainer: Color(0xff6f5a00),
      secondary: Color(0xff6f5d1c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfffbe192),
      onSecondaryContainer: Color(0xff766321),
      tertiary: Color(0xff526600),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffc1e34d),
      onTertiaryContainer: Color(0xff506400),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff1f1b10),
      onSurfaceVariant: Color(0xff4d4632),
      outline: Color(0xff7f765f),
      outlineVariant: Color(0xffd1c6ab),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353024),
      inversePrimary: Color(0xffedc200),
      primaryFixed: Color(0xffffe07f),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffedc200),
      onPrimaryFixedVariant: Color(0xff564500),
      secondaryFixed: Color(0xfffbe192),
      onSecondaryFixed: Color(0xff231b00),
      secondaryFixedDim: Color(0xffddc579),
      onSecondaryFixedVariant: Color(0xff564503),
      tertiaryFixed: Color(0xffcef059),
      onTertiaryFixed: Color(0xff171e00),
      tertiaryFixedDim: Color(0xffb2d33f),
      onTertiaryFixedVariant: Color(0xff3d4d00),
      surfaceDim: Color(0xffe2d9c7),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf3e0),
      surfaceContainer: Color(0xfff6eddb),
      surfaceContainerHigh: Color(0xfff0e7d5),
      surfaceContainerHighest: Color(0xffebe2cf),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff423500),
      surfaceTint: Color(0xff725c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff836b00),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff423500),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7f6b29),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e3b00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff5f7500),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff141107),
      onSurfaceVariant: Color(0xff3c3622),
      outline: Color(0xff5a523d),
      outlineVariant: Color(0xff756c56),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353024),
      inversePrimary: Color(0xffedc200),
      primaryFixed: Color(0xff836b00),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff675300),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7f6b29),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff655312),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff5f7500),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff495c00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec6b4),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf3e0),
      surfaceContainer: Color(0xfff0e7d5),
      surfaceContainerHigh: Color(0xffe5dcca),
      surfaceContainerHighest: Color(0xffd9d1bf),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff372b00),
      surfaceTint: Color(0xff725c00),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff594700),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff372b00),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff584706),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff253000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3f4f00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f0),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff322c19),
      outlineVariant: Color(0xff504934),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff353024),
      inversePrimary: Color(0xffedc200),
      primaryFixed: Color(0xff594700),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3e3100),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff584706),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3e3100),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3f4f00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2b3700),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8a7),
      surfaceBright: Color(0xfffff8f0),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f0dd),
      surfaceContainer: Color(0xffebe2cf),
      surfaceContainerHigh: Color(0xffdcd4c2),
      surfaceContainerHighest: Color(0xffcec6b4),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff1ce),
      surfaceTint: Color(0xffedc200),
      onPrimary: Color(0xff3c2f00),
      primaryContainer: Color(0xffffd102),
      onPrimaryContainer: Color(0xff6f5a00),
      secondary: Color(0xffddc579),
      onSecondary: Color(0xff3c2f00),
      secondaryContainer: Color(0xff564503),
      onSecondaryContainer: Color(0xffcbb369),
      tertiary: Color(0xffdfff77),
      onTertiary: Color(0xff293500),
      tertiaryContainer: Color(0xffc1e34d),
      onTertiaryContainer: Color(0xff506400),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff171309),
      onSurface: Color(0xffebe2cf),
      onSurfaceVariant: Color(0xffd1c6ab),
      outline: Color(0xff9a9077),
      outlineVariant: Color(0xff4d4632),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe2cf),
      inversePrimary: Color(0xff725c00),
      primaryFixed: Color(0xffffe07f),
      onPrimaryFixed: Color(0xff231b00),
      primaryFixedDim: Color(0xffedc200),
      onPrimaryFixedVariant: Color(0xff564500),
      secondaryFixed: Color(0xfffbe192),
      onSecondaryFixed: Color(0xff231b00),
      secondaryFixedDim: Color(0xffddc579),
      onSecondaryFixedVariant: Color(0xff564503),
      tertiaryFixed: Color(0xffcef059),
      onTertiaryFixed: Color(0xff171e00),
      tertiaryFixedDim: Color(0xffb2d33f),
      onTertiaryFixedVariant: Color(0xff3d4d00),
      surfaceDim: Color(0xff171309),
      surfaceBright: Color(0xff3e392c),
      surfaceContainerLowest: Color(0xff110e05),
      surfaceContainerLow: Color(0xff1f1b10),
      surfaceContainer: Color(0xff231f14),
      surfaceContainerHigh: Color(0xff2e2a1e),
      surfaceContainerHighest: Color(0xff393428),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff1ce),
      surfaceTint: Color(0xffedc200),
      onPrimary: Color(0xff3c2f00),
      primaryContainer: Color(0xffffd102),
      onPrimaryContainer: Color(0xff4e3e00),
      secondary: Color(0xfff4db8d),
      onSecondary: Color(0xff2f2500),
      secondaryContainer: Color(0xffa58f49),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffdfff77),
      onTertiary: Color(0xff293500),
      tertiaryContainer: Color(0xffc1e34d),
      onTertiaryContainer: Color(0xff374500),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff171309),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe7dbc0),
      outline: Color(0xffbcb197),
      outlineVariant: Color(0xff999077),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe2cf),
      inversePrimary: Color(0xff574600),
      primaryFixed: Color(0xffffe07f),
      onPrimaryFixed: Color(0xff171000),
      primaryFixedDim: Color(0xffedc200),
      onPrimaryFixedVariant: Color(0xff423500),
      secondaryFixed: Color(0xfffbe192),
      onSecondaryFixed: Color(0xff171000),
      secondaryFixedDim: Color(0xffddc579),
      onSecondaryFixedVariant: Color(0xff423500),
      tertiaryFixed: Color(0xffcef059),
      onTertiaryFixed: Color(0xff0e1300),
      tertiaryFixedDim: Color(0xffb2d33f),
      onTertiaryFixedVariant: Color(0xff2e3b00),
      surfaceDim: Color(0xff171309),
      surfaceBright: Color(0xff494437),
      surfaceContainerLowest: Color(0xff0a0702),
      surfaceContainerLow: Color(0xff211d12),
      surfaceContainer: Color(0xff2c281c),
      surfaceContainerHigh: Color(0xff373226),
      surfaceContainerHighest: Color(0xff423d30),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff1ce),
      surfaceTint: Color(0xffedc200),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffd102),
      onPrimaryContainer: Color(0xff291f00),
      secondary: Color(0xffffefc5),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd9c175),
      onSecondaryContainer: Color(0xff100b00),
      tertiary: Color(0xffdfff77),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffc1e34d),
      onTertiaryContainer: Color(0xff1b2400),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff171309),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfffbefd3),
      outlineVariant: Color(0xffcdc2a7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffebe2cf),
      inversePrimary: Color(0xff574600),
      primaryFixed: Color(0xffffe07f),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffedc200),
      onPrimaryFixedVariant: Color(0xff171000),
      secondaryFixed: Color(0xfffbe192),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffddc579),
      onSecondaryFixedVariant: Color(0xff171000),
      tertiaryFixed: Color(0xffcef059),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffb2d33f),
      onTertiaryFixedVariant: Color(0xff0e1300),
      surfaceDim: Color(0xff171309),
      surfaceBright: Color(0xff555042),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f14),
      surfaceContainer: Color(0xff353024),
      surfaceContainerHigh: Color(0xff403b2e),
      surfaceContainerHighest: Color(0xff4b4639),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.surfaceContainer,
      foregroundColor: colorScheme.onSurface,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurfaceVariant,
    ),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
