import 'package:flutter/material.dart';
import 'package:sartex_tv/screen/tv/settings_page.dart';
import 'package:sartex_tv/screen/tv/tv_screen.dart';
import 'package:sartex_tv/utils/prefs.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      Row(children: [
        Text('Refresh rate ${prefs.getInt('interval') ?? 1} min'),
        Expanded(child: Container()),
        IconButton(onPressed: interval, icon: Icon(Icons.edit))
      ]),
      Row(children: [
        Text('URL ${prefs.getString('path') ?? ''}'),
        Expanded(child: Container()),
        IconButton(onPressed: selectPath, icon: Icon(Icons.edit))
      ]),
      Row(
        children: [OutlinedButton(onPressed: start, child: Text('Start'))],
      )
    ])));
  }

  void selectPath() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => SettingsPage()));
  }

  void interval() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => SettingsPage()));
  }

  void start() {
    Navigator.push(
        context, MaterialPageRoute(builder: (builder) => TVScreen()));
  }
}
