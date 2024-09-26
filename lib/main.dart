import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'modules/app_module.dart';
import 'modules/hive_module/hive_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();
  runApp(ModularApp(module: AppModule(), child: const MyApp()));
}

Locale myLocale = const Locale('pt', 'BR');

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() async {
    await Modular.get<HiveConfig>().init();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: myLocale,
      title: 'Dev Flutter Test',
      routerConfig: Modular.routerConfig,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
