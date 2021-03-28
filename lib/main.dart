import 'dart:io';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sidekick/app_shell.dart';
import 'package:sidekick/models/app_settings.model.dart';
import 'package:sidekick/providers/settings.provider.dart';
import 'package:sidekick/services/app_settings_service.dart';

import 'package:sidekick/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sidekick/utils/get_theme_mode.dart';
import 'package:window_size/window_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(AppSettingsAdapter());
  await Hive.initFlutter();
  await AppSettingsService.init();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Sidekick');
    setWindowMinSize(const Size(800, 500));
    setWindowMaxSize(Size.infinite);
  }
  runApp(ProviderScope(child: FvmApp()));
}

class FvmApp extends HookWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    var themeMode = getThemeMode(AppSettingsService.readIsOpen().themeMode);
    return OKToast(
      child: MaterialApp(
        title: 'Sidekick',
        debugShowCheckedModeBanner: false,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: themeMode,
        home: const AppShell(),
      ),
    );
  }
}
