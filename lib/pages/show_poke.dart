import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poke_app/api/poke_fetcher.dart';
import 'package:poke_app/models/poke_model.dart';

class ShowPokemon extends StatefulWidget {
  const ShowPokemon({super.key, required this.url, required this.name});
  final String url;
  final String name;

  @override
  State<ShowPokemon> createState() => _ShowPokemonState();
}

class _ShowPokemonState extends State<ShowPokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: GoogleFonts.protestGuerrilla(),
        ),
      ),
      body: FutureBuilder<PokeModel>(
          future: fetchPokeMon(widget.url),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Error to show data!!!"));
            }
            if (!snapshot.hasData) {
              return const Center(child: Text("Data not found"));
            }
            final pokemon = snapshot.data;
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(
                        pokemon.img,
                        scale: 0.5,
                      ),
                      Image.network(
                        pokemon.snImg,
                        scale: 0.5,
                      ),
                    ],
                  ),
                  Text(pokemon.name,
                      style: GoogleFonts.bebasNeue(fontSize: 36)),
                  Container(
                    padding: const EdgeInsets.only(left: 18, top: 8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Height ${pokemon.height}",
                          style: GoogleFonts.bebasNeue(fontSize: 24),
                        ),
                        Text(
                          "Weight ${pokemon.weight}",
                          style: GoogleFonts.bebasNeue(fontSize: 24),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
