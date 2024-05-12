import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/points/points_num.dart';

class Points extends StatelessWidget {
  final int points;
  const Points({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            //  alignment: Alignment.center,
            children: [
              // Image.asset(
              //   ImageApp.background,
              //   fit: BoxFit.fitWidth,
              //   width: double.infinity,
              //   height: double.infinity,
              //   alignment: Alignment.topCenter,
              // ),
              verticalSpace(50),
              Text(
                'نقاطى',
                style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.black,
                ),
              ),
              verticalSpace(70),
              Text(
                'استلم هديتك من شركة\nالحرف اليدوية فى العوالى',
                style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.black,
                ),
              ),
              verticalSpace(80),
              InkWell(
                onTap: () {
                  push(PointsNum(
                    points: points,
                  ));
                },
                child: Image.asset('assets/images/gift2.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
