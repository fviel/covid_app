import 'dart:ui';
import 'package:flutter/material.dart';

//Cores
const kBackgroundColor = Color(0xFFFEFEFE);
const kTitleTextColor = Color(0xFF303030);
const kBodyTextColor = Color(0xFF4B4B4B);
const kTextLightColor = Color(0xFF959595);
const kInfectedColor = Color(0xFFFF8748);
const kDeathColor = Color(0xFFFF4848);
const kRecoverColor = Color(0xFF36C12C);
const kPrimaryColor = Color(0xFF3382CC);
const kShadowColor = Color(0x32B7B7B7);
const kActiveShadowColor = Color(0x594056C6);
//TODO - Verificar pq num aceita o comando .withOpacity
// const kShadowColor = Color(0xFFB7B7B7).withOpacity(0.16);
// const kActiveShadowColor = Color(0xFF4056C6).withOpacity(0.15);

//Estilos de texto
const kHeadingTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);

const kSubTextStyle = TextStyle(
  fontSize: 16,
  color: kTextLightColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kTitleTextColor,
);

