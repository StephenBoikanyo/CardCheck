import 'package:card_check/l10n/l10n.dart';
import 'package:card_check/presentation/home/add_card_screen.dart';
import 'package:card_check/presentation/home/banned_countries.dart';
import 'package:card_check/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        HomeScreen.id :(context) => HomeScreen(),
        AddCardScreen.id :(context) => AddCardScreen(),
        BannedCountriesScreen.id :(context) =>BannedCountriesScreen()
      },
      home:  HomeScreen(),
    );
  }
}
