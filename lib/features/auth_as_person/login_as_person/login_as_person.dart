import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/auth_as_person/widgets/login_form.dart';

class LoginAsPerson extends StatefulWidget {
  const LoginAsPerson({super.key});

  @override
  State<LoginAsPerson> createState() => _LoginAsPersonState();
}

class _LoginAsPersonState extends State<LoginAsPerson> {
  bool isArabicSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
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
                  Center(
                    child: Image.asset(
                      ImageApp.completedLogo,
                      width: 150,
                      height: 150,
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      ImageApp.authBackground,
                      width: 500,
                      height: 500,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  verticalSpace(100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'مرحبا بكم ',
                            textAlign: TextAlign.center,
                            style: AppTextstyles
                                .textFamilyMadaniSize18Weight100Colorblue50,
                          ),
                        ),
                        Text(
                          'تسجيل الدخول  ',
                          style: TextStyle(
                              fontFamily: 'Madani',
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        verticalSpace(20),
                        const LoginForm(),
                      ],
                    ),
                  )
                ],
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
