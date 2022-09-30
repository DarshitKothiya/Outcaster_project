import 'package:cupertino_store/cartpage.dart';
import 'package:cupertino_store/homepage.dart';
import 'package:cupertino_store/searchpage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> const homePage(),
        'searchPage': (context)=> const searchPage(),
        'cartPage': (context)=> const cartPage(),
      },
    )
  );
}