import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/const/dark_colors.dart';
import 'package:places/const/sizes.dart';
import 'package:places/const/textstyle.dart';

/// Темы для приложения
class AppThemes {
  /// светлая тема
  // ignore: long-method
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      backgroundColor: AppColors.background,
      primaryColor: AppColors.white,
      primaryColorLight: AppColors.background,
      primaryColorDark: AppColors.whiteMain,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.inactiveBlack,
        primary: AppColors.whiteMain,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondary2,
        tertiary: AppColors.whiteGreen,
        tertiaryContainer: AppColors.whiteYellow,
        error: AppColors.whiteRed,
        onSecondary: AppColors.secondary,
        onSecondaryContainer: AppColors.secondary2,
      ),
      errorColor: AppColors.whiteRed,
      scaffoldBackgroundColor: AppColors.white,
      dividerColor: AppColors.inactiveBlack,
      disabledColor: AppColors.inactiveBlack,
      cardColor: AppColors.background,
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
      textTheme: base.textTheme.copyWith(
        headline6: CTextStyles.text.copyWith(color: AppColors.secondary),
        headline5: CTextStyles.subtitle.copyWith(color: AppColors.whiteMain),
        headline4: CTextStyles.title.copyWith(color: AppColors.secondary),
        headline3: CTextStyles.largeTitle.copyWith(color: AppColors.secondary),
        subtitle1: CTextStyles.smallBold.copyWith(color: AppColors.secondary),
        subtitle2: CTextStyles.small.copyWith(color: AppColors.secondary2),
        bodyText1: CTextStyles.text.copyWith(color: AppColors.secondary),
        bodyText2: CTextStyles.small.copyWith(color: AppColors.secondary),
        caption: CTextStyles.superSmall.copyWith(color: AppColors.secondary),
        button: CTextStyles.button,
        headline2:
            CTextStyles.subtitlesecondary.copyWith(color: AppColors.whiteMain),
        headline1: CTextStyles.stext.copyWith(color: AppColors.secondary),
        // bodyMedium: CTextStyles.stext.copyWith(color: AppColors.secondary),
        // bodyLarge: CTextStyles.stext.copyWith(color: AppColors.secondary),
        // bodySmall: CTextStyles.stext.copyWith(color: AppColors.secondary),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelStyle: CTextStyles.smallBold,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.inactiveBlack,
        indicator: const BoxDecoration(
          color: AppColors.whiteMain,
          borderRadius: BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        elevation: 0,
        backgroundColor: AppColors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color.fromARGB(255, 196, 198, 223),
        unselectedItemColor: const Color.fromARGB(255, 8, 16, 92),
        // selectedItemColor: AppColors.whiteMain,
        // unselectedItemColor: AppColors.secondary,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.whiteGreen,
          ),
          foregroundColor: MaterialStateProperty.all(
            AppColors.white,
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(
              AppSizes.paddingBtnNormal,
            ),
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppSizes.radiusBtnNormal),
            ),
          ),
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        activeTrackColor: AppColors.whiteGreen,
        inactiveTrackColor: AppColors.inactiveBlack,
        thumbColor: AppColors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
        ),
        trackShape: const RectangularSliderTrackShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
          elevation: 4,
        ),
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  /// темная тема
  // ignore: long-method
  static ThemeData get darkTheme {
    final base = ThemeData.dark();

    return base.copyWith(
      backgroundColor: AppColors.blackDark,
      primaryColor: AppColors.blackMain,
      primaryColorLight: AppColors.background,
      primaryColorDark: AppColors.white,
      colorScheme: base.colorScheme.copyWith(
        background: AppColors.inactiveBlack,
        primary: AppColors.blackMain,
        onPrimary: AppColors.white,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondary2,
        tertiary: AppColors.blackGreen,
        tertiaryContainer: AppColors.blackYellow,
        error: AppColors.blackRed,
        onSecondary: AppColors.white,
        onSecondaryContainer: AppColors.white,
      ),
      errorColor: AppColors.blackRed,
      scaffoldBackgroundColor: AppColors.blackMain,
      dividerColor: AppColors.secondary2,
      disabledColor: AppColors.inactiveBlack,
      cardColor: AppColors.blackDark,
      iconTheme: const IconThemeData(
        color: AppColors.white,
        size: 24,
      ),
      textTheme: base.textTheme.copyWith(
        headline6: CTextStyles.text.copyWith(color: AppColors.white),
        headline5: CTextStyles.subtitle.copyWith(color: AppColors.white),
        headline4: CTextStyles.title.copyWith(color: AppColors.white),
        headline3: CTextStyles.largeTitle.copyWith(color: AppColors.white),
        subtitle1: CTextStyles.smallBold.copyWith(color: AppColors.secondary2),
        subtitle2: CTextStyles.small.copyWith(color: AppColors.secondary2),
        bodyText1: CTextStyles.text.copyWith(color: AppColors.white),
        bodyText2: CTextStyles.small.copyWith(color: AppColors.white),
        caption: CTextStyles.superSmall,
        button: CTextStyles.button,
        headline2:
            CTextStyles.subtitlesecondary.copyWith(color: AppColors.whiteMain),
        headline1: CTextStyles.stext.copyWith(color: AppColors.secondary),
        // bodyMedium: CTextStyles.stext.copyWith(color: AppColors.white),
        // bodyLarge: CTextStyles.stext.copyWith(color: AppColors.white),
        // bodySmall: CTextStyles.stext.copyWith(color: AppColors.white),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
      ),
      tabBarTheme: base.tabBarTheme.copyWith(
        labelStyle: CTextStyles.smallBold,
        labelColor: AppColors.secondary,
        unselectedLabelColor: AppColors.secondary2,
        indicator: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(
            AppSizes.radiusBtnSwitch,
          ),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
        elevation: 0,
        backgroundColor: AppColors.blackMain,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.background,
        type: BottomNavigationBarType.fixed,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.blackGreen,
          ),
          foregroundColor: MaterialStateProperty.all(
            AppColors.white,
          ),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(
              AppSizes.paddingBtnNormal,
            ),
          ),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppSizes.radiusBtnNormal),
            ),
          ),
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        trackHeight: 2,
        activeTrackColor: AppColors.blackGreen,
        inactiveTrackColor: AppColors.inactiveBlack,
        thumbColor: AppColors.white,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
        ),
        trackShape: const RectangularSliderTrackShape(),
        rangeThumbShape: const RoundRangeSliderThumbShape(
          enabledThumbRadius: AppSizes.paddingCommon / 2,
          disabledThumbRadius: AppSizes.paddingCommon / 2,
          elevation: 4,
        ),
        rangeTrackShape: const RectangularRangeSliderTrackShape(),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
    );
  }

  AppThemes._();
}
