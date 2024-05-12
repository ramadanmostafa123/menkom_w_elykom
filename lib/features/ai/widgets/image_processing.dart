import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/ai/widgets/processing_results.dart';

class ImageProcessing extends StatefulWidget {
  const ImageProcessing({super.key});

  @override
  State<ImageProcessing> createState() => _ImageProcessingState();
}

class _ImageProcessingState extends State<ImageProcessing> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ProcessingResults()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Madani',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    FadeAnimatedText('... Loading'),
                    FadeAnimatedText('...'),
                    FadeAnimatedText('.. Processing'),
                  ],
                  pause: const Duration(milliseconds: 500),
                ),
              ),
            ),
            verticalSpace(80),
            Center(
              child: SizedBox(
                width: 240,
                child: Text(
                  'نعمل على معالجة الصورة خلال ثوانى سننقلك على صفحة نتائج المعالجة...',
                  style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                    color: AppColors.mainColor,
                    height: 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
