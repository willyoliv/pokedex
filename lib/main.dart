import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';

import 'pages/home/home.dart';
import 'package:pokedex/pages/pokemon_details/pokemon_details.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderPokemons()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedéx',
        theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const Home(),
          "/pokemon_details": (context) => const PokemonDetails(),
        });
  }
}
