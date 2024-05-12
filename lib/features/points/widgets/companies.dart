import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';

class CompaniesLogo extends StatelessWidget {
  const CompaniesLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/Cartoon Restaurant .png',
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/Coffee Cup, .png',
              ),
            ),
            // Expanded(
            //   child: Image.asset(
            //     'assets/images/company_logo_3.png',
            //   ),
            // ),
          ],
        ),
        verticalSpace(10),
        Row(
          children: [
            // Expanded(
            //   child: Image.asset(
            //     'assets/images/.png',
            //   ),
            // ),
            Expanded(
              child: Image.asset(
                'assets/images/points4.png',
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/points3.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
