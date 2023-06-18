import 'package:flutter/material.dart';
//sürekli kullandığımız sabitler (renkler, tekrar eden kodlar gibi) için bir sabit dosyası oluşturuyoruz

const kMainUrl =
    "https://www.thecocktaildb.com/api/json/v1/1/search.php?s="; //kokteyl apisinin adresi

const kRandomUrl =
    "https://www.thecocktaildb.com/api/json/v1/1/random.php"; //random button api

const kBackgroundColor =  Color(0xFF1F2129);
const kComponentColor = Color(0xFF3C4D74);
const kGroupBackgroundColor = Color(0XFF383D4D);

const kHeaderTextStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

const kTableTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
);

const kBorderSide = BorderSide(color: kComponentColor, width: 5);

const kBoxDecorationStyle = BoxDecoration(
  //orta kisimda gri arka plan
  color: kGroupBackgroundColor,
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const kButtonMinSize = Size(100, 35);
