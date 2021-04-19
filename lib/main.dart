import 'dart:ui';
import 'package:covid_app/info_screen.dart';
import 'package:covid_app/widgets/counter.dart';
import 'package:flutter/material.dart';
import 'package:covid_app/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:covid_app/widgets/clippathbannertopo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
        textTheme: TextTheme(
            bodyText2: TextStyle(
          color: kBodyTextColor,
        )),
      ),
//      home: HomeScreen(),
    home: InfoScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ClipPathBannerTopoComImagem(
          imagemMedica: "assets/icons/Drcorona.svg",
          textTop: "Se puder, ",
          textBottom: "fique em casa.",
        ),
        //"assets/images/virus.png"
        Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Color(0xFFE5E5E5),
            ),
          ),
          child: Row(
            children: <Widget>[
              SvgPicture.asset("assets/icons/maps-and-flags.svg"),
              SizedBox(width: 20),
              Expanded(
                child: DropdownButton(
                  isExpanded: true,
                  underline: SizedBox(),
                  icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                  value: 'Brasil',
                  items: ['Brasil', 'Argentina', 'Chile', 'Uruguay']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Case Update  ",
                          style: kTitleTextStyle,
                        ),
                        TextSpan(
                          text: "Newest update March 28",
                          style: TextStyle(
                            color: kTextLightColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///o spacer preenche o espaço e joga o text lá pro final da row
                  Spacer(),
                  Text(
                    'See details',
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  //arredonda a borda do container
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Row(
                  ///divide os elementos dessa row por igual, sem precisar de sizedBox
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Counter(
                        color: kInfectedColor, number: 1046, title: 'Infected'),
                    Counter(color: kDeathColor, number: 87, title: 'Deaths'),
                    Counter(
                        color: kRecoverColor, number: 46, title: 'Recovered'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                  //separa os texts, mas podia ter usado um Spacer
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Text(
                    //   'Spread of Virus',
                    //   style: kTitleTextStyle,
                    // ),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Spread of Virus  ",
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ]
              ),
              Container(
                margin: EdgeInsets.only(top:20),
                padding: EdgeInsets.all(20),
                height: 178,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,10),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Image.asset(
                    "assets/images/map.png",
                    fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}




