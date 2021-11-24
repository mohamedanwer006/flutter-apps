import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trend/theme/app_colors.dart';

///darkTheme
ThemeData themeData = ThemeData(
    textTheme: TextTheme(
      headline6: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      headline5: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      headline4: GoogleFonts.macondo(color: AppColors.darkTextColor),
      headline3: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      headline2: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      headline1: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      subtitle1: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      subtitle2: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      bodyText1: GoogleFonts.emilysCandy(color: AppColors.darkTextColor),
      bodyText2: GoogleFonts.jaldi(color: AppColors.darkTextColor),
      caption: GoogleFonts.jaldi(color: AppColors.lightTextColor),
      overline: GoogleFonts.jaldi(color: AppColors.darkTextColor),
    ),
    backgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: AppColors.iconActiveColor),
    cardColor: AppColors.cardColor,
    accentColor: AppColors.accentColor,
    dialogTheme: DialogTheme(elevation: 0),
    dialogBackgroundColor: AppColors.cardColor,
    canvasColor: AppColors.backgroundColor,
    hoverColor: AppColors.primaryColor.withOpacity(0.2),
    highlightColor: AppColors.primaryColor.withOpacity(0.4),
    dividerColor: AppColors.dividerColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    tabBarTheme: TabBarTheme(),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith((state) {
        // if (state.contains(MaterialState)) {

        // }
        return AppColors.primaryColor;
      }),
      overlayColor: MaterialStateProperty.resolveWith((state) {
        // if (state.contains(MaterialState)) {

        // }
        return AppColors.primaryColor.withOpacity(0.1);
      }),
    )),
    appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        actionsIconTheme: IconThemeData(color: AppColors.iconDeActiveColor)));
