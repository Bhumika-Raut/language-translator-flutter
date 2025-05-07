import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  final translator = GoogleTranslator();
  final TextEditingController textController = TextEditingController();
  
  String originLanguage = "English";
  String destinationLanguage = "Hindi";
  String translatedText = "";

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Hindi': 'hi',
    'Marathi': 'mr',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh-cn',
  };

  void translateText() async {
    if (textController.text.isNotEmpty) {
      var translation = await translator.translate(
        textController.text,
        from: languageCodes[originLanguage]!,
        to: languageCodes[destinationLanguage]!,
      );
      setState(() {
        translatedText = translation.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff01023d),
      appBar: AppBar(
  title: const Text(
    "Language Translator",
    style: TextStyle(color: Colors.white),
  ),
  centerTitle: true,
  backgroundColor: const Color(0xff01023d),
  elevation: 0,
  iconTheme: const IconThemeData(color: Colors.white), 
),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    value: originLanguage,
                    dropdownColor: Colors.black87,
                    style: const TextStyle(color: Colors.white),
                    items: languageCodes.keys.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        originLanguage = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  const Icon(Icons.arrow_forward, color: Colors.white),
                  const SizedBox(width: 20),
                  DropdownButton(
                    value: destinationLanguage,
                    dropdownColor: Colors.black87,
                    style: const TextStyle(color: Colors.white),
                    items: languageCodes.keys.map((lang) {
                      return DropdownMenuItem(
                        value: lang,
                        child: Text(lang),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        destinationLanguage = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: textController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter text',
                    hintStyle: const TextStyle(color: Colors.white60),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white10,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: translateText,
                child: const Text("Translate"),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  translatedText,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
