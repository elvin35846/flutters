import 'package:PokeDex/pokemon_detail.dart';
import 'package:flutter/material.dart';
import 'package:PokeDex/model/pokedex.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  RemoteApiModel pokedex;
  Future<RemoteApiModel> payloadPokemon;

  Future<RemoteApiModel> getAllPokemons() async {
    var response = await http.get(url);
    var decodedResponse = json.decode(response.body);
    pokedex = RemoteApiModel.fromJson(decodedResponse);
    return pokedex;
  }

  @override
  void initState() {
    super.initState();
    payloadPokemon = getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("PokeDex"),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientatation) {
          if (orientatation == Orientation.portrait) {
            return FutureBuilder(
                future: payloadPokemon,
                builder:
                    (context, AsyncSnapshot<RemoteApiModel> returnPokedex) {
                  if (returnPokedex.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (returnPokedex.connectionState ==
                      ConnectionState.done) {
                    // return GridView.builder(
                    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //         crossAxisCount: 2),
                    //     itemBuilder: (context, index) {
                    //       return Text(returnPokedex.data.pokemon[index].name);
                    //     });
                    return GridView.count(
                      padding: EdgeInsets.all(10),
                      crossAxisCount: 2,
                      children: returnPokedex.data.pokemon.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemoDetail(
                                      pokemon: e,
                                    )));
                          },
                          child: Hero(
                              tag: e.img,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 4,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 110,
                                        height: 110,
                                        child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: "assets/loading.gif",
                                            image: e.img),
                                      ),
                                      Text(
                                        e.name,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                  return null;
                });
          } else {
            return FutureBuilder(
                future: payloadPokemon,
                builder:
                    (context, AsyncSnapshot<RemoteApiModel> returnPokedex) {
                  if (returnPokedex.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (returnPokedex.connectionState ==
                      ConnectionState.done) {
                    return GridView.extent(
                      maxCrossAxisExtent: 300,
                      padding: EdgeInsets.all(10),
                      children: returnPokedex.data.pokemon.map((e) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PokemoDetail(
                                      pokemon: e,
                                    )));
                          },
                          child: Hero(
                              tag: e.img,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                elevation: 4,
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 160,
                                        height: 160,
                                        child: FadeInImage.assetNetwork(
                                            fit: BoxFit.cover,
                                            placeholder: "assets/loading.gif",
                                            image: e.img),
                                      ),
                                      Text(
                                        e.name,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        );
                      }).toList(),
                    );
                  }
                  return null;
                });
          }
        },
      ),
    );
  }
}
