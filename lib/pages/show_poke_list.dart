import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/api/poke_list_fetcher.dart';
import 'package:poke_app/models/poke_link_model.dart';
import 'package:poke_app/pages/show_poke.dart';

class ShowPokeList extends StatefulWidget {
  const ShowPokeList({super.key});

  @override
  State<ShowPokeList> createState() => _ShowPokeListState();
}

class _ShowPokeListState extends State<ShowPokeList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "PokeMon App",
            style: GoogleFonts.protestGuerrilla(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: StreamBuilder<List<PokemonList>>(
            stream: fetchPokelistStream(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error Something wrong!!!"),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Data Not Found"),
                );
              }
              final pokemonList = snapshot.data!;

              return ListView.builder(
                  itemCount: pokemonList.length,
                  itemBuilder: (context, index) {
                    final pokemonlink = pokemonList[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShowPokemon(
                                      url: pokemonlink.url,
                                      name: pokemonlink.name,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        margin: const EdgeInsets.only(top: 12, bottom: 12),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/pokeball.png',
                              scale: 10,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              pokemonlink.name,
                              style: GoogleFonts.bebasNeue(fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
