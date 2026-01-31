import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sartex_tv/screen/tv/tv_screen.dart';
import 'package:sartex_tv/utils/prefs.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final c1 = TextEditingController();
  final c2 = TextEditingController();


  @override
  void initState() {
    super.initState();
    c1.text = ' ${prefs.getInt('interval') ?? 1}';
    c2.text = prefs.getString('path') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(

          minimum: const EdgeInsets.all(20),
            child: Column(children: [
              Row(children: [
                Expanded(child:  TextFormField(controller: c1))]),
              Row(children: [
               Expanded(child: TextFormField(controller: c2))
              ]),

              TextButton(onPressed: save, child: Text('Save'))
            ])));
  }

void save() {
    prefs.setInt('interval', int.tryParse(c1.text) ?? 1);
    prefs.setString('path', c2.text);
    Navigator.pop(context);
}



}
