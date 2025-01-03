import 'package:chateo/core/themes/dark_theme.dart';
import 'package:chateo/core/themes/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
class Theme extends _$Theme {
  @override
  ThemeData build() {
    return ref.watch(lightThemeProvider);
  }

  void switchTheme() {
    if (state.brightness == Brightness.light) {
      state = ref.watch(darkThemeProvider);
    } else {
      state = ref.watch(lightThemeProvider);
    }
  }
}
