import 'dart:ui';
import 'package:covid_app/constant.dart';
import 'package:covid_app/widgets/clippathbannertopo.dart';
import 'package:covid_app/widgets/counter.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipPathBannerTopoComImagem(
            imagemMedica: "assets/icons/coronadr.svg",
            textTop: "Saiba mais ",
            textBottom: "sobre o Covid-19.",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "Sintomas",
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SymptomCard(
                      imagem: "assets/images/headache.png",
                      titulo: "Dor de Cabeça",
                      isActive: true,
                    ),
                    SymptomCard(
                        imagem: "assets/images/caugh.png",
                        titulo: "Tosse"),
                    SymptomCard(
                        imagem: "assets/images/febre.png",
                        titulo: "Febre"),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Prevenção",
                  style: kTitleTextStyle,
                ),
                SizedBox(height: 20),
                SizedBox(height: 156,
                child:Stack(
                  children: <Widget> [
                    Container(
                      height: 136,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow:[
                          BoxShadow(
                            offset: Offset(0,8),
                            blurRadius: 24,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                    ),
                    Image.asset("assets/images/wear_mask.png"),
                  ],
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String imagem;
  final String titulo;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.imagem,
    this.titulo,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(
            imagem, //"assets/images/headache.png"
            height: 90,
          ),
          Text(
            titulo,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
