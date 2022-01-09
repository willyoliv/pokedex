import 'package:flutter/material.dart';
import 'package:pokedex/shared/theme/colors/color_height.dart';
import 'package:pokedex/shared/theme/colors/shadow_color_height.dart';
import 'package:pokedex/shared/theme/colors/color_type.dart';
import 'package:pokedex/shared/theme/colors/background_color_type.dart';
import 'package:pokedex/shared/theme/colors/shadow_color_type.dart';
import 'package:pokedex/shared/theme/colors/color_weight.dart';
import 'package:pokedex/shared/theme/colors/shadow_color_weight.dart';

class AppColors {
  static final textGrey = Color(0xFF747476);
  static final textBlack = Color(0xFF17171B);
  static final backgroundDefaultInput = Color(0xFFF2F2F2);
  static final backgroundPressedInput = Color(0xFFE2E2E2);
  static final white = Color(0xFFF5F5F5);
  static final grey = Color(0xFFE5E5E5);
  static final whiteSecondary = Color(0xFFFFFFFF);
  static final icon = Color(0xFFF1F1F1);
  static final shadow = Color(0xFFFADBDB);

  static final MaterialColor primaryColor = const MaterialColor(
    0xFFEA5D60,
    <int, Color>{
      50: Color(0xFFEA5D60),
      100: Color(0xFFEA5D60),
      200: Color(0xFFEA5D60),
      300: Color(0xFFEA5D60),
      400: Color(0xFFEA5D60),
      500: Color(0xFFEA5D60),
      600: Color(0xFFEA5D60),
      700: Color(0xFFEA5D60),
      800: Color(0xFFEA5D60),
      900: Color(0xFFEA5D60),
    },
  );

  static final Map<String, Color> badges = {
    'bug': ColorType.bug,
    'dark': ColorType.dark,
    'dragon': ColorType.dragon,
    'electric': ColorType.electric,
    'fairy': ColorType.fairy,
    'fire': ColorType.fire,
    'fighting': ColorType.fighting,
    'flying': ColorType.flying,
    'grass': ColorType.grass,
    'ground': ColorType.ground,
    'ghost': ColorType.ghost,
    'ice': ColorType.ice,
    'normal': ColorType.normal,
    'poison': ColorType.poison,
    'psychic': ColorType.psychic,
    'rock': ColorType.rock,
    'steel': ColorType.steel,
    'water': ColorType.water,
  };

  static final Map<String, Color> cardBackground = {
    'bug': BackgroundColorType.bug,
    'dark': BackgroundColorType.dark,
    'dragon': BackgroundColorType.dragon,
    'electric': BackgroundColorType.electric,
    'fairy': BackgroundColorType.fairy,
    'fire': BackgroundColorType.fire,
    'fighting': BackgroundColorType.fighting,
    'flying': BackgroundColorType.flying,
    'grass': BackgroundColorType.grass,
    'ground': BackgroundColorType.ground,
    'ghost': BackgroundColorType.ghost,
    'ice': BackgroundColorType.ice,
    'normal': BackgroundColorType.normal,
    'poison': BackgroundColorType.poison,
    'psychic': BackgroundColorType.psychic,
    'rock': BackgroundColorType.rock,
    'steel': BackgroundColorType.steel,
    'water': BackgroundColorType.water,
  };

  static final Map<String, Color> shadows = {
    'bug': ShadowColorType.bug,
    'dark': ShadowColorType.dark,
    'dragon': ShadowColorType.dragon,
    'electric': ShadowColorType.electric,
    'fairy': ShadowColorType.fairy,
    'fire': ShadowColorType.fire,
    'fighting': ShadowColorType.fighting,
    'flying': ShadowColorType.flying,
    'grass': ShadowColorType.grass,
    'ground': ShadowColorType.ground,
    'ghost': ShadowColorType.ghost,
    'ice': ShadowColorType.ice,
    'normal': ShadowColorType.normal,
    'poison': ShadowColorType.poison,
    'psychic': ShadowColorType.psychic,
    'rock': ShadowColorType.rock,
    'steel': ShadowColorType.steel,
    'water': ShadowColorType.water,
  };

  static final Map<String, Color> height = {
    'short': ColorHeight.short,
    'medium': ColorHeight.medium,
    'tall': ColorHeight.tall,
  };

  static final Map<String, Color> shadowHeight = {
    'short': ShadowColorHeight.short,
    'medium': ShadowColorHeight.medium,
    'tall': ShadowColorHeight.tall,
  };

  static final Map<String, Color> weight = {
    'light': ColorWeight.light,
    'normal': ColorWeight.normal,
    'heavy': ColorWeight.heavy,
  };

  static final Map<String, Color> shadowWeight = {
    'light': ShadowColorWeight.light,
    'normal': ShadowColorWeight.normal,
    'heavy': ShadowColorWeight.heavy,
  };
}
