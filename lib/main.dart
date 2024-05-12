import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/features/ai/ai_provider.dart';
import 'package:mekom_w_elykom/features/auth_as_person/auth_provider.dart';
import 'package:mekom_w_elykom/features/salla/salla_provider.dart';
import 'package:mekom_w_elykom/menkom_w_elykom.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 

  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AiProvider()),
        ChangeNotifierProvider(create: (_) => AuthhProvider()),
        ChangeNotifierProvider(create: (_) => SallaProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'AR')],
        path: 'assets/translation',
        fallbackLocale: const Locale('ar', 'AR'),
        child: const MenkomWelykomApp(
        ),
      ),
    ),
  );
}
