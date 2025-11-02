
import 'package:flutter/material.dart';

class AppBrand extends ThemeExtension<AppBrand> {
  final double radius;
  final double spacing;

  const AppBrand({required this.radius, required this.spacing});

  @override
  AppBrand copyWith({double? radius, double? spacing}) {
    return AppBrand(
      radius: radius ?? this.radius,
      spacing: spacing ?? this.spacing,
    );
  }

  @override
  AppBrand lerp(ThemeExtension<AppBrand>? other, double t) {
    if (other is! AppBrand) return this;
    return AppBrand(
      radius: lerpDouble(radius, other.radius, t)!,
      spacing: lerpDouble(spacing, other.spacing, t)!,
    );
  }

  static double? lerpDouble(double a, double b, double t) => a + (b - a) * t;
}

class AppTheme {
  static final ColorScheme _lightScheme =
      ColorScheme.fromSeed(seedColor: const Color(0xFF3D5AFE)); // Indigo

  static final ColorScheme _darkScheme =
      ColorScheme.fromSeed(seedColor: const Color(0xFF3D5AFE), brightness: Brightness.dark);

  static final _brand = const AppBrand(radius: 16, spacing: 12);

  
  

  // Tutarlı tipografi
  static const _textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 48, fontWeight: FontWeight.w700, letterSpacing: -0.5),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: -0.2),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 16, height: 1.35),
    bodyMedium: TextStyle(fontSize: 14, height: 1.35),
    labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
  );

  static InputDecorationTheme _inputDecoration(ColorScheme scheme) {
    final radius = const Radius.circular(16);
    OutlineInputBorder border(Color c) => OutlineInputBorder(
          borderRadius: BorderRadius.all(radius),
          borderSide: BorderSide(color: c, width: 1.2),
        );
    return InputDecorationTheme(
      filled: true,
      fillColor: scheme.surfaceContainerHighest,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: border(scheme.outlineVariant),
      enabledBorder: border(scheme.outlineVariant),
      focusedBorder: border(scheme.primary),
      errorBorder: border(scheme.error),
      labelStyle: TextStyle(color: scheme.onSurfaceVariant),
      hintStyle: TextStyle(color: scheme.onSurfaceVariant),
    );
  }

  static FilledButtonThemeData _filledButton(ColorScheme scheme) {
    return FilledButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 14)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        textStyle: WidgetStateProperty.all(const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButton(ColorScheme scheme) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 18, vertical: 14)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        elevation: WidgetStateProperty.resolveWith((states) => states.contains(WidgetState.pressed) ? 0 : 1),
      ),
    );
  }



static ThemeData get light {
    final t = ThemeData(
      useMaterial3: true,
      colorScheme: _lightScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecoration(_lightScheme),
      filledButtonTheme: _filledButton(_lightScheme),
      elevatedButtonTheme: _elevatedButton(_lightScheme),

      // 🔹 Kartlar
      cardTheme: _cardTheme(_lightScheme),

      // 🔹 ListTile için tek yerden padding/renk
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.all(12),
        titleTextStyle: _textTheme.titleMedium?.copyWith(
          color: _lightScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        subtitleTextStyle: _textTheme.bodyMedium?.copyWith(
          color: _lightScheme.onSurfaceVariant,
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: _lightScheme.surface,
        foregroundColor: _lightScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: _textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
    ).copyWith(extensions: <ThemeExtension<dynamic>>[_brand]);

    return t;
  }

  static ThemeData get dark {
    final t = ThemeData(
      useMaterial3: true,
      colorScheme: _darkScheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecoration(_darkScheme),
      filledButtonTheme: _filledButton(_darkScheme),
      elevatedButtonTheme: _elevatedButton(_darkScheme),

      cardTheme: _cardTheme(_darkScheme),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.all(12),
        titleTextStyle: _textTheme.titleMedium?.copyWith(
          color: _darkScheme.onSurface,
          fontWeight: FontWeight.w700,
        ),
        subtitleTextStyle: _textTheme.bodyMedium?.copyWith(
          color: _darkScheme.onSurfaceVariant,
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: _darkScheme.surface,
        foregroundColor: _darkScheme.onSurface,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: _textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
    ).copyWith(extensions: <ThemeExtension<dynamic>>[_brand]);

    return t;
  }

  static CardThemeData _cardTheme(ColorScheme scheme) {
    final brand = _brand; // AppBrand(radius:16, spacing:12)
    return CardThemeData(
      elevation: 1, // çok hafif gölge
      surfaceTintColor: scheme.surfaceTint, // m3 ile uyumlu
      color: scheme.surfaceContainerLowest,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // 🔹 yan boşluk
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(brand.radius),
        side: BorderSide(color: scheme.outlineVariant), // ince çerçeve
      ),
      clipBehavior: Clip.antiAlias,
    );
  }

}
