import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/repository_providers.dart';

part 'theme_view_model.g.dart';

@Riverpod(keepAlive: true)
class ThemeViewModel extends _$ThemeViewModel {
  @override
  Future<ThemeMode> build() {
    return ref.watch(themeRepositoryProvider).load();
  }

  Future<void> toggleTheme() async {
    final current = state.asData?.value ?? ThemeMode.light;
    final next = current == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await ref.read(themeRepositoryProvider).save(next);
    state = AsyncData(next);
  }
}
