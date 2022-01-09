import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/providers/provider_pokemons.dart';
import 'package:pokedex/shared/theme/colors/app_colors.dart';
import 'package:pokedex/shared/utils/enum_pages_details.dart';
import 'package:pokedex/shared/widgets/custom_sliver_details/custom_sliver_details.dart';
import 'package:pokedex/shared/widgets/custom_sliver_header/custom_sliver_header.dart';
import 'package:pokedex/shared/widgets/custom_sliver_header_menu/custom_sliver_header_menu.dart';
import 'package:pokedex/shared/widgets/pokemon_about_details/pokemon_about_details.dart';
import 'package:pokedex/shared/widgets/pokemon_evolution_details/pokemon_evolution_details.dart';
import 'package:pokedex/shared/widgets/pokemon_stats_details/pokemon_stats_details.dart';
import 'package:provider/provider.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({Key? key}) : super(key: key);

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  String text = "about";
  var statePage = StatePageDetails.about;
  late ScrollController _controller;
  late ScrollController _controller2;
  bool _enableScroll = false;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller2 = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        bool isTop = _controller.position.pixels == 0;
        if (isTop) {
          setState(() {
            _enableScroll = false;
          });
        } else {
          setState(() {
            _enableScroll = true;
          });
        }
      }
    });
  }

  void setStatePage(StatePageDetails state) {
    setState(() {
      statePage = state;
    });
  }

  Widget _getWidgetByState(StatePageDetails state, Pokemon pokemon,
      bool enableScroll, ScrollController controller) {
    switch (state) {
      case StatePageDetails.about:
        return PokemonAboutDetails(
            pokemon: pokemon,
            enableScroll: enableScroll,
            controller: controller);
      case StatePageDetails.stats:
        return PokemonStatsDetails(
            pokemon: pokemon,
            enableScroll: enableScroll,
            controller: controller);
      case StatePageDetails.evoluvion:
        return PokemonEvolutionDetails(pokemon: pokemon);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    var _pokemonProvider = Provider.of<ProviderPokemons>(context, listen: true);
    var _pokemon = _pokemonProvider.pokemon;
    return Scaffold(
      backgroundColor: AppColors.cardBackground[_pokemon.types[0].type.name],
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overScroll) {
          overScroll.disallowIndicator();
          return false;
        },
        child: CustomScrollView(
          controller: _controller,
          slivers: [
            SliverPersistentHeader(
              delegate:
                  CustomSliverHeader(expandedHeight: 283, pokemon: _pokemon),
              pinned: true,
            ),
            SliverPersistentHeader(
              delegate: CustomSliverHeaderMenu(
                expandedHeight: 52,
                setStatePage: setStatePage,
                statePage: statePage,
                color: AppColors.cardBackground[_pokemon.types[0].type.name]!,
              ),
              pinned: true,
            ),
            SliverPersistentHeader(
              delegate: CustomSliverDetails(
                expandedHeight: MediaQuery.of(context).size.height * 0.85,
                widget: _getWidgetByState(
                    statePage, _pokemon, _enableScroll, _controller2),
              ),
              pinned: true,
            ),
            // SliverToBoxAdapter(
            //   child: Container(
            //     width: MediaQuery.of(context).size.width,
            //     padding: const EdgeInsets.all(40),
            //     constraints: BoxConstraints(
            //       minHeight: MediaQuery.of(context).size.height * 0.85,
            //     ),
            //     decoration: BoxDecoration(
            //       color: AppColors.whiteSecondary,
            //       borderRadius: const BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30),
            //       ),
            //     ),
            //     child: _getWidgetByState(statePage, _pokemon),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
