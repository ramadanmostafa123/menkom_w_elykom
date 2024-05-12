// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';

import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/home/home.dart';
import 'package:mekom_w_elykom/features/points/point.dart';
import 'package:mekom_w_elykom/features/support/support.dart';
import 'package:mekom_w_elykom/features/talabat/talabat.dart';

class Settings extends StatelessWidget {
  const Settings({
    Key? key,
    required this.points,
  }) : super(key: key);
  final int points;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الاعدادات',
          style: AppTextstyles.textFamilyMadaniSize16Weight400,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextButton(
                onPressed: () {
                  push(Points(points: points));
                },
                buttonText: 'Your Points',
                textStyle: AppTextstyles.textFamilyMadaniSize16Weight400
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(10),
              AppTextButton(
                onPressed: () {
                  push(const Talabati());
                },
                buttonText: 'Talabati',
                textStyle: AppTextstyles.textFamilyMadaniSize16Weight400
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(10),
              AppTextButton(
                onPressed: () {
                  push(const Support());
                },
                buttonText: 'Support',
                textStyle: AppTextstyles.textFamilyMadaniSize16Weight400
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(10),
              AppTextButton(
                onPressed: () {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.disconnect();
                  push(const Home());
                },
                buttonText: 'Logout',
                textStyle: AppTextstyles.textFamilyMadaniSize16Weight400
                    .copyWith(color: AppColors.appRed),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
