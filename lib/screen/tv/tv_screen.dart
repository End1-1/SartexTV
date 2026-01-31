import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sartex_tv/utils/prefs.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TVScreen extends StatefulWidget {
  const TVScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  late final WebViewController controller;
  Timer? reloadTimer;

  @override
  void initState() {
    super.initState();

    controller = WebViewController.fromPlatformCreationParams(
      const PlatformWebViewControllerCreationParams(),
    )..loadRequest(
      Uri.parse(prefs.getString('path') ?? 'https://google.com'),
    );

    reloadTimer = Timer.periodic(Duration(minutes: prefs.getInt('interval') ?? 1), (timer) {
      controller.reload();
    });
  }

  @override
  void dispose() {
    reloadTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(5),
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}
