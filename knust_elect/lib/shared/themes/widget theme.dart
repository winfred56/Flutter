import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// LIGHT MODE ⚡
ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
  blendLevel: 15,
  appBarStyle: FlexAppBarStyle.material,
  appBarOpacity: 0.00,
  tabBarStyle: FlexTabBarStyle.forBackground,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 4,
    blendOnColors: false,
    defaultRadius: 15.0,
    elevatedButtonRadius: 7.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    outlinedButtonRadius: 8.0,
    outlinedButtonPressedBorderWidth: 4.0,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    sliderTrackHeight: 3,
    inputDecoratorSchemeColor: SchemeColor.tertiaryContainer,
    inputDecoratorRadius: 17.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedBorderWidth: 1.0,
    bottomSheetElevation: 3.0,
    bottomSheetModalElevation: 3.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);

/// DARK MODE 🌑
ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.redWine,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  tabBarStyle: FlexTabBarStyle.forBackground,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    defaultRadius: 15.0,
    elevatedButtonRadius: 7.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    outlinedButtonRadius: 8.0,
    outlinedButtonPressedBorderWidth: 4.0,
    unselectedToggleIsColored: true,
    sliderValueTinted: true,
    sliderTrackHeight: 3,
    inputDecoratorRadius: 17.0,
    inputDecoratorUnfocusedHasBorder: false,
    inputDecoratorFocusedBorderWidth: 1.0,
    bottomSheetElevation: 3.0,
    bottomSheetModalElevation: 3.0,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: GoogleFonts.notoSans().fontFamily,
);
