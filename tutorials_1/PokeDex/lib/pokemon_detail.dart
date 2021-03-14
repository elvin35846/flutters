import 'package:PokeDex/model/pokedex.dart';
import 'package:flutter/material.dart';

class PokemoDetail extends StatelessWidget {
  final Pokemon pokemon;
  const PokemoDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return portraitBody(context);
          } else {
            return landscapeBody(context);
          }
        },
      ),
    );
  }

  Widget landscapeBody(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black45, blurRadius: 3, offset: Offset(0, 3))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 250,
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pokemon.name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Height: " + pokemon.height,
                    style: TextStyle(fontSize: 14)),
                Text("Weight: " + pokemon.weight,
                    style: TextStyle(fontSize: 14)),
                Text("Typse",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: pokemon.type
                      .map((e) => Chip(
                            backgroundColor: Colors.deepOrange[200],
                            label: Text(e, style: TextStyle(fontSize: 12)),
                          ))
                      .toList(),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Text("Next Evolution",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((e) => Chip(
                                backgroundColor: Colors.deepOrange[200],
                                label: Text(e.name,
                                    style: TextStyle(fontSize: 12)),
                              ))
                          .toList()
                      : [
                          Text("Not next evolution",
                              style: TextStyle(fontSize: 14))
                        ],
                ),
                Text("Weaknesses",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((e) => Chip(
                                backgroundColor: Colors.deepOrange[200],
                                label: Text(e, style: TextStyle(fontSize: 12)),
                              ))
                          .toList()
                      : [
                          Text("Not next evolution",
                              style: TextStyle(fontSize: 14))
                        ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget portraitBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: MediaQuery.of(context).size.width - 20,
          //height: MediaQuery.of(context).size.height - (2 / 3),
          left: 10,
          top: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.05,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 120),
                Text(pokemon.name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text("Height: " + pokemon.height,
                    style: TextStyle(fontSize: 14)),
                Text("Weight: " + pokemon.weight,
                    style: TextStyle(fontSize: 14)),
                Text("Typse",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  children: pokemon.type
                      .map((e) => Chip(
                            backgroundColor: Colors.deepOrange[200],
                            label: Text(e, style: TextStyle(fontSize: 12)),
                          ))
                      .toList(),
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
                Text("Next Evolution",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((e) => Chip(
                                backgroundColor: Colors.deepOrange[200],
                                label: Text(e.name,
                                    style: TextStyle(fontSize: 12)),
                              ))
                          .toList()
                      : [
                          Text("Not next evolution",
                              style: TextStyle(fontSize: 14))
                        ],
                ),
                Text("Weaknesses",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((e) => Chip(
                                backgroundColor: Colors.deepOrange[200],
                                label: Text(e, style: TextStyle(fontSize: 12)),
                              ))
                          .toList()
                      : [
                          Text("Not next evolution",
                              style: TextStyle(fontSize: 14))
                        ],
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 180,
                width: 180,
                child: Image.network(
                  pokemon.img,
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ],
    );
  }
}
