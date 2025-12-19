import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_reader/pages/pages.dart';
import 'package:qr_reader/themes/primary_theme.dart';

import 'providers/providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'QR Reader',
          initialRoute: 'home',
          routes: {
            'home': (_) => const HomePage(),
            'maps': (_) => const MapPage()
          },
          theme: PrimaryTheme.lightTheme),
    );
  }
}
