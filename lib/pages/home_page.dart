import 'package:flutter/material.dart';
import 'package:flutterdex/controllers/pokedex_controller.dart';
import 'package:flutterdex/pages/pokemon_search_delegate.dart';
import 'package:flutterdex/theme/colors.dart';
import 'package:flutterdex/widgets/icons/pokeball.dart';
import 'package:flutterdex/widgets/pokedex_entry/pokedex_entries.dart';
import 'package:flutterdex/widgets/pokedex_entry/pokemon_stats.dart';
import 'package:flutterdex/widgets/pokedex_entry/type_chips.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/pokedex_entry/pokedex_background.dart';
import '../widgets/pokedex_entry/pokedex_header.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PokedexController _pokedexController =
      Get.put<PokedexController>(PokedexController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pokédex',
          style: GoogleFonts.changa(fontWeight: FontWeight.bold),
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: PokemonSearchDelegate());
              },
              icon: const Icon(Icons.search_rounded))
        ],
      ),
      body: Obx(
        () => _pokedexController.showLoadScreen.value
            ? Container(
                height: Get.height,
                child: Image.asset(
                  'assets/loading.gif',
                  fit: BoxFit.fitHeight,
                ),
              )
            : Stack(
                children: [
                  const PokedexBackground(),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      height: Get.height,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          PokedexHeader(pokedexController: _pokedexController),
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                  width: double.infinity,
                                  child: FadeInImage.assetNetwork(
                                      placeholder: 'assets/substitute.png',
                                      image: _pokedexController.getImageUrl,
                                      fadeInDuration:
                                          const Duration(milliseconds: 250),
                                      height: Get.height * 0.25)),
                              TypeChips(pokedexController: _pokedexController)
                            ],
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder()),
                              onPressed: () {
                                Get.bottomSheet(
                                    Container(
                                        color: Colors.white,
                                        child: PokedexStats(
                                            pokedexController:
                                                _pokedexController)),
                                    barrierColor:
                                        Colors.white.withOpacity(0.5));
                              },
                              child: Container(
                                width: Get.width * 0.3,
                                child: Text(
                                  "Stats",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )),
                          SizedBox(height: 15),
                          Container(
                              width: double.infinity,
                              child: Text(
                                'Pokédex Entries:',
                                style: TextStyle(fontSize: 25),
                              )),
                          PokedexEntries(pokedexController: _pokedexController)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      backgroundColor: pokeRed,
    );
  }
}
