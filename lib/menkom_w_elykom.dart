import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/features/intro_screen/intro_screen.dart';
import 'package:mekom_w_elykom/main.dart';

class MenkomWelykomApp extends StatelessWidget {
  // final int points;
  const MenkomWelykomApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: navigator,
      home: const IntroOverboardPage(),

    );

// 

// fake 
  }
}
