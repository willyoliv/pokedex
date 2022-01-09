import 'package:flutter/material.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';

abstract class TextStyles {
  static TextStyle pokemonNumber = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: AppColors.textBlack.withOpacity(0.6),
  );

  static TextStyle badgeTypePokemon = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.whiteSecondary,
  );

  static TextStyle labelDetails = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.textBlack,
  );

  static TextStyle additionalText = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.textGrey,
  );

  static TextStyle pokemonEvoluationLevel = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 12,
    color: AppColors.textBlack,
  );

  static TextStyle genderMale = const TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color(0xFF748FC9),
  );

  static TextStyle genderFemale = const TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: Color(0xFFF6B6E3),
  );

  static TextStyle totalStats = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.textGrey,
  );

  static TextStyle subtitles = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.textBlack,
  );

  static TextStyle pokemonNumberDetails = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.textBlack.withOpacity(0.6),
  );

  static TextStyle text = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.textGrey,
  );

  static TextStyle textButtonSelected = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.whiteSecondary,
  );

  static TextStyle textButton = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.whiteSecondary.withOpacity(0.5),
  );

  static TextStyle resetButton = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.textGrey,
  );

  static TextStyle applyButton = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    color: AppColors.whiteSecondary,
  );

  static TextStyle pokemonName = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.whiteSecondary,
  );

  static TextStyle titleModal = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 26,
    color: AppColors.textBlack,
  );
  static TextStyle title = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: AppColors.textBlack,
  );

  static TextStyle pokemonNameDetails = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w700,
    fontSize: 32,
    color: AppColors.whiteSecondary,
  );
}
