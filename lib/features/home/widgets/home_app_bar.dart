


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';

class HomeApBar extends StatefulWidget {
  const HomeApBar({super.key});

  @override
  State<HomeApBar> createState() => _HomeApBarState();
}

class _HomeApBarState extends State<HomeApBar> {
  bool isArabicSelected = false;
  @override
  Widget build(BuildContext context) {
    return   AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AppTextButton(
              buttonWidth: 100,
              buttonText: isArabicSelected ? 'English' : 'العربية',
              textStyle: const TextStyle(
                fontFamily: 'Madani',
                fontSize: 15,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  isArabicSelected = !isArabicSelected;
                  if (isArabicSelected) {
                    context.setLocale(const Locale('en', 'US'));
                  } else {
                    context.setLocale(const Locale('ar', 'AR'));
                  }
                });
              }),
        ),
      )
     ;
  }
}