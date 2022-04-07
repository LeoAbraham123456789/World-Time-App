import 'package:flutter/material.dart';
import 'package:myappflutter/pages/choose_location.dart';
import 'package:myappflutter/pages/home.dart';
import 'package:myappflutter/pages/loading.dart';

void main()=> runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location' : (context) => ChooseLocation(),
  },
));

