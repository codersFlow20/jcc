import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English'; // Default language
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  _loadSelectedLanguage() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguage = prefs.getString('selected_language') ?? 'English';
    });
  }

  _saveSelectedLanguage() async {
    await prefs.setString('selected_language', selectedLanguage);
    print(prefs.getString('selected_language'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.language,
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Select your preferred language:'),
            RadioListTile(
              title: const Text('English'),
              value: 'en',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value as String;
                });
              },
            ),
            RadioListTile(
              title: const Text('Gujarati'),
              value: 'gu',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value as String;
                });
              },
            ),
            RadioListTile(
              title: const Text('Hindi'),
              value: 'hi',
              groupValue: selectedLanguage,
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value as String;
                });
              },
            ),
            Expanded(child: SizedBox(height: 20)),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveSelectedLanguage();
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Language changed'),
                      content:
                          Text('Please restart the app to see the changes.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            SystemChannels.platform
                                .invokeMethod('SystemNavigator.pop');
                          },
                          child: Text('OK'),
                        ),
                        TextButton(
                          onPressed: () {
                            context.pop();
                            context.pop();
                          },
                          child: Text("Cancel"),
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
