import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff006971),
      surfaceTint: Color(0xff006971),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff9df0f9),
      onPrimaryContainer: Color(0xff004f55),
      secondary: Color(0xff066b5b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa0f2de),
      onSecondaryContainer: Color(0xff005144),
      tertiary: Color(0xff2e6a44),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffb1f1c1),
      onTertiaryContainer: Color(0xff12512e),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff181d17),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbec8c9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81d3dd),
      primaryFixed: Color(0xff9df0f9),
      onPrimaryFixed: Color(0xff002023),
      primaryFixedDim: Color(0xff81d3dd),
      onPrimaryFixedVariant: Color(0xff004f55),
      secondaryFixed: Color(0xffa0f2de),
      onSecondaryFixed: Color(0xff00201a),
      secondaryFixedDim: Color(0xff84d6c2),
      onSecondaryFixedVariant: Color(0xff005144),
      tertiaryFixed: Color(0xffb1f1c1),
      onTertiaryFixed: Color(0xff00210e),
      tertiaryFixedDim: Color(0xff96d5a6),
      onTertiaryFixedVariant: Color(0xff12512e),
      surfaceDim: Color(0xffd7dbd2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffebefe6),
      surfaceContainerHigh: Color(0xffe6e9e0),
      surfaceContainerHighest: Color(0xffe0e4db),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003d42),
      surfaceTint: Color(0xff006971),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff167881),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003e34),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff237a69),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003f20),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3d7952),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff0e120d),
      onSurfaceVariant: Color(0xff2e3839),
      outline: Color(0xff4b5455),
      outlineVariant: Color(0xff656f70),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81d3dd),
      primaryFixed: Color(0xff167881),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff005e66),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff237a69),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006052),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3d7952),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff23603b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c8bf),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f5ec),
      surfaceContainer: Color(0xffe6e9e0),
      surfaceContainerHigh: Color(0xffdaded5),
      surfaceContainerHighest: Color(0xffcfd3ca),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003236),
      surfaceTint: Color(0xff006971),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff005258),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00332a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005346),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003419),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff155430),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff7fbf1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff252e2f),
      outlineVariant: Color(0xff414b4c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d322c),
      inversePrimary: Color(0xff81d3dd),
      primaryFixed: Color(0xff005258),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00393e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005346),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a31),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff155430),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003b1e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6bab2),
      surfaceBright: Color(0xfff7fbf1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef2e9),
      surfaceContainer: Color(0xffe0e4db),
      surfaceContainerHigh: Color(0xffd2d6cd),
      surfaceContainerHighest: Color(0xffc4c8bf),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff81d3dd),
      surfaceTint: Color(0xff81d3dd),
      onPrimary: Color(0xff00363b),
      primaryContainer: Color(0xff004f55),
      onPrimaryContainer: Color(0xff9df0f9),
      secondary: Color(0xff84d6c2),
      onSecondary: Color(0xff00382e),
      secondaryContainer: Color(0xff005144),
      onSecondaryContainer: Color(0xffa0f2de),
      tertiary: Color(0xff96d5a6),
      onTertiary: Color(0xff00391c),
      tertiaryContainer: Color(0xff12512e),
      onTertiaryContainer: Color(0xffb1f1c1),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff10140f),
      onSurface: Color(0xffe0e4db),
      onSurfaceVariant: Color(0xffbec8c9),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff006971),
      primaryFixed: Color(0xff9df0f9),
      onPrimaryFixed: Color(0xff002023),
      primaryFixedDim: Color(0xff81d3dd),
      onPrimaryFixedVariant: Color(0xff004f55),
      secondaryFixed: Color(0xffa0f2de),
      onSecondaryFixed: Color(0xff00201a),
      secondaryFixedDim: Color(0xff84d6c2),
      onSecondaryFixedVariant: Color(0xff005144),
      tertiaryFixed: Color(0xffb1f1c1),
      onTertiaryFixed: Color(0xff00210e),
      tertiaryFixedDim: Color(0xff96d5a6),
      onTertiaryFixedVariant: Color(0xff12512e),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff363a34),
      surfaceContainerLowest: Color(0xff0b0f0a),
      surfaceContainerLow: Color(0xff181d17),
      surfaceContainer: Color(0xff1c211b),
      surfaceContainerHigh: Color(0xff272b25),
      surfaceContainerHighest: Color(0xff323630),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff97eaf3),
      surfaceTint: Color(0xff81d3dd),
      onPrimary: Color(0xff002b2e),
      primaryContainer: Color(0xff479da6),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff9aecd8),
      onSecondary: Color(0xff002c24),
      secondaryContainer: Color(0xff4d9f8d),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffabebbb),
      onTertiary: Color(0xff002d15),
      tertiaryContainer: Color(0xff619e73),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff10140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd4dedf),
      outline: Color(0xffaab4b5),
      outlineVariant: Color(0xff889293),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff005057),
      primaryFixed: Color(0xff9df0f9),
      onPrimaryFixed: Color(0xff001416),
      primaryFixedDim: Color(0xff81d3dd),
      onPrimaryFixedVariant: Color(0xff003d42),
      secondaryFixed: Color(0xffa0f2de),
      onSecondaryFixed: Color(0xff001510),
      secondaryFixedDim: Color(0xff84d6c2),
      onSecondaryFixedVariant: Color(0xff003e34),
      tertiaryFixed: Color(0xffb1f1c1),
      onTertiaryFixed: Color(0xff001507),
      tertiaryFixedDim: Color(0xff96d5a6),
      onTertiaryFixedVariant: Color(0xff003f20),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff41463f),
      surfaceContainerLowest: Color(0xff050805),
      surfaceContainerLow: Color(0xff1a1f19),
      surfaceContainer: Color(0xff252923),
      surfaceContainerHigh: Color(0xff2f342e),
      surfaceContainerHighest: Color(0xff3a3f39),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc6f9ff),
      surfaceTint: Color(0xff81d3dd),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xff7dd0d9),
      onPrimaryContainer: Color(0xff000e0f),
      secondary: Color(0xffb2ffeb),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff80d2be),
      onSecondaryContainer: Color(0xff000e0a),
      tertiary: Color(0xffbfffce),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff92d1a3),
      onTertiaryContainer: Color(0xff000f04),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff10140f),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffe8f2f3),
      outlineVariant: Color(0xffbbc4c5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e4db),
      inversePrimary: Color(0xff005057),
      primaryFixed: Color(0xff9df0f9),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xff81d3dd),
      onPrimaryFixedVariant: Color(0xff001416),
      secondaryFixed: Color(0xffa0f2de),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff84d6c2),
      onSecondaryFixedVariant: Color(0xff001510),
      tertiaryFixed: Color(0xffb1f1c1),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff96d5a6),
      onTertiaryFixedVariant: Color(0xff001507),
      surfaceDim: Color(0xff10140f),
      surfaceBright: Color(0xff4d514b),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c211b),
      surfaceContainer: Color(0xff2d322c),
      surfaceContainerHigh: Color(0xff383d36),
      surfaceContainerHighest: Color(0xff444842),
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

    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.shade200,
      filled: true,
      enabledBorder: kOutlineInputBorder,
      border: kOutlineInputBorder,
      focusedBorder: kOutlineInputBorder,
    ),

    chipTheme: ChipThemeData(
      elevation: 5.0,
      backgroundColor: colorScheme.primary,
      labelStyle: textTheme.labelLarge!.copyWith(color: colorScheme.onPrimary),
    ),
  );

  OutlineInputBorder get kOutlineInputBorder => OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.transparent),
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
