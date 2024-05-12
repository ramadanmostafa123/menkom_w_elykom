import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.arrow_back,
              size: 30,
            ),
            Image.asset(
              ImageApp.completedLogo,
              height: 200,
              width: 200,
            ),
          ],
        ),
      ],
    );
  }
}
