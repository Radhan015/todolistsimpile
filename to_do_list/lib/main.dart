import 'package:flutter/material.dart';
import 'package:to_do_list/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
        
      }
  }

//Apps Flutter Pertama M Naufal Ramadhan
//Saya membuat aplikasi to do list dari channel Tech With Otabek
//Link video : https://youtu.be/VfdTUKt21Ls?si=j1lUcmTkHT1qjChs