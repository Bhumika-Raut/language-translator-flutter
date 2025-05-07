import 'package:flutter/material.dart';
import 'languagetranslator.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translator',
      debugShowCheckedModeBanner: false,
      home: const LanguageTranslationPage(), 
    );
  }
}
