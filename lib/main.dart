import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:covid_app/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
            padding: EdgeInsets.only(left: 40, top: 50, right: 20),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF3383CD), Color(0xFF11249F)]),
              image: DecorationImage(
                image: AssetImage("assets/images/virus.png"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset("assets/icons/menu.svg"),
                ),
                SizedBox(height: 20),
                Expanded(
                    child: Stack(
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/icons/Drcorona.svg",
                      width: 230,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    ),
                    Positioned(
                      top: 20,
                      left: 150,
                      child: Text(
                        "Se puder, \nfique em casa.",
                        style: kHeadingTextStyle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(),
                  ],
                ))
              ],
            ),
          ),
        ),
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
                child: Image.asset("assets/images/map.png"),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class Counter extends StatelessWidget {
  final int number; //número de infectados
  final Color color;
  final String title;

  const Counter({
    Key key,
    this.number,
    this.color,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //o container abaixo é a bola vermelha
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle, //deixa o container como um circulo
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '$number',
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(
          title,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}

//faz o acabamento arredondado do container
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
