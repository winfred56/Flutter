import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// LIGHT MODE ⚡
ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 6,
  appBarStyle: FlexAppBarStyle.material,
  appBarOpacity: 0.60,
  tabBarStyle: FlexTabBarStyle.forBackground,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 6,
    blendOnColors: false,
    defaultRadius: 15.0,
    elevatedButtonRadius: 5.0,
    outlinedButtonRadius: 8.0,
    unselectedToggleIsColored: true,
    inputDecoratorSchemeColor: SchemeColor.tertiaryContainer,
    inputDecoratorRadius: 17.0,
    inputDecoratorUnfocusedHasBorder: false,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);

/// DARK MODE 🌑
ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
  blendLevel: 15,
  appBarStyle: FlexAppBarStyle.background,
  appBarOpacity: 0.90,
  tabBarStyle: FlexTabBarStyle.forBackground,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 30,
    defaultRadius: 15.0,
    elevatedButtonRadius: 5.0,
    outlinedButtonRadius: 8.0,
    unselectedToggleIsColored: true,
    inputDecoratorRadius: 17.0,
    inputDecoratorUnfocusedHasBorder: false,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
