import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4287646282),
      surfaceTint: Color(4287646282),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294957784),
      onPrimaryContainer: Color(4282058764),
      secondary: Color(4286010965),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957784),
      onSecondaryContainer: Color(4281079061),
      tertiary: Color(4287514966),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957533),
      onTertiaryContainer: Color(4282058517),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294637823),
      onSurface: Color(4279900961),
      onSurfaceVariant: Color(4282337355),
      outline: Color(4285495675),
      outlineVariant: Color(4290758859),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4294947761),
      primaryFixed: Color(4294957784),
      onPrimaryFixed: Color(4282058764),
      primaryFixedDim: Color(4294947761),
      onPrimaryFixedVariant: Color(4285739828),
      secondaryFixed: Color(4294957784),
      onSecondaryFixed: Color(4281079061),
      secondaryFixedDim: Color(4293311931),
      onSecondaryFixedVariant: Color(4284301118),
      tertiaryFixed: Color(4294957533),
      onTertiaryFixed: Color(4282058517),
      tertiaryFixedDim: Color(4294947517),
      onTertiaryFixedVariant: Color(4285674303),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293124841),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285411120),
      surfaceTint: Color(4287646282),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4289355615),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284037947),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589483),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4285345595),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4289224556),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294637823),
      onSurface: Color(4279900961),
      onSurfaceVariant: Color(4282074183),
      outline: Color(4283916643),
      outlineVariant: Color(4285758591),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4294947761),
      primaryFixed: Color(4289355615),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287448904),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589483),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285813843),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4289224556),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4287317844),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293124841),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282650386),
      surfaceTint: Color(4287646282),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285411120),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281604891),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284037947),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282584604),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285345595),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294637823),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280100136),
      outline: Color(4282074183),
      outlineVariant: Color(4282074183),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281282614),
      inversePrimary: Color(4294960869),
      primaryFixed: Color(4285411120),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283570716),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284037947),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394149),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285345595),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283504934),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292532704),
      surfaceBright: Color(4294637823),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294243322),
      surfaceContainer: Color(4293848564),
      surfaceContainerHigh: Color(4293453807),
      surfaceContainerHighest: Color(4293124841),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294947761),
      surfaceTint: Color(4294947761),
      onPrimary: Color(4283833631),
      primaryContainer: Color(4285739828),
      onPrimaryContainer: Color(4294957784),
      secondary: Color(4293311931),
      onSecondary: Color(4282657065),
      secondaryContainer: Color(4284301118),
      onSecondaryContainer: Color(4294957784),
      tertiary: Color(4294947517),
      onTertiary: Color(4283833641),
      tertiaryContainer: Color(4285674303),
      onTertiaryContainer: Color(4294957533),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279374616),
      onSurface: Color(4293124841),
      onSurfaceVariant: Color(4290758859),
      outline: Color(4287206037),
      outlineVariant: Color(4282337355),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124841),
      inversePrimary: Color(4287646282),
      primaryFixed: Color(4294957784),
      onPrimaryFixed: Color(4282058764),
      primaryFixedDim: Color(4294947761),
      onPrimaryFixedVariant: Color(4285739828),
      secondaryFixed: Color(4294957784),
      onSecondaryFixed: Color(4281079061),
      secondaryFixedDim: Color(4293311931),
      onSecondaryFixedVariant: Color(4284301118),
      tertiaryFixed: Color(4294957533),
      onTertiaryFixed: Color(4282058517),
      tertiaryFixedDim: Color(4294947517),
      onTertiaryFixedVariant: Color(4285674303),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294949304),
      surfaceTint: Color(4294947761),
      onPrimary: Color(4281598983),
      primaryContainer: Color(4291525242),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293640639),
      onSecondary: Color(4280684560),
      secondaryContainer: Color(4289562759),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294949058),
      onTertiary: Color(4281533200),
      tertiaryContainer: Color(4291394183),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294769407),
      onSurfaceVariant: Color(4291022031),
      outline: Color(4288390311),
      outlineVariant: Color(4286285191),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124841),
      inversePrimary: Color(4285805621),
      primaryFixed: Color(4294957784),
      onPrimaryFixed: Color(4281073924),
      primaryFixedDim: Color(4294947761),
      onPrimaryFixedVariant: Color(4284359460),
      secondaryFixed: Color(4294957784),
      onSecondaryFixed: Color(4280290059),
      secondaryFixedDim: Color(4293311931),
      onSecondaryFixedVariant: Color(4283051822),
      tertiaryFixed: Color(4294957533),
      onTertiaryFixed: Color(4281073675),
      tertiaryFixedDim: Color(4294947517),
      onTertiaryFixedVariant: Color(4284293679),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281545786),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294965753),
      surfaceTint: Color(4294947761),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294949304),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294965753),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293640639),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294965753),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4294949058),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279374616),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294180095),
      outline: Color(4291022031),
      outlineVariant: Color(4291022031),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293124841),
      inversePrimary: Color(4283307801),
      primaryFixed: Color(4294959326),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294949304),
      onPrimaryFixedVariant: Color(4281598983),
      secondaryFixed: Color(4294959326),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293640639),
      onSecondaryFixedVariant: Color(4280684560),
      tertiaryFixed: Color(4294959074),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4294949058),
      onTertiaryFixedVariant: Color(4281533200),
      surfaceDim: Color(4279374616),
      surfaceBright: Color(4281874751),
      surfaceContainerLowest: Color(4279045651),
      surfaceContainerLow: Color(4279900961),
      surfaceContainer: Color(4280164133),
      surfaceContainerHigh: Color(4280887855),
      surfaceContainerHighest: Color(4281545786),
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
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
