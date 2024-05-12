import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';
import 'package:mekom_w_elykom/features/agreement_acceptance_page/agreement_acceptance_page.dart';
import 'package:mekom_w_elykom/features/ai/ai.dart';
import 'package:mekom_w_elykom/features/auth_as_person/auth_provider.dart';
import 'package:mekom_w_elykom/features/auth_as_person/register_as_person/register_as_person.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/social_app.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'البريد الالكتروني',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(30),
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'كلمة المرور',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(10),
        Text(
          'هل نسيت كلمة المرور ؟',
          style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
            color: Colors.blue,
          ),
        ),
        verticalSpace(10),
        InkWell(
          onTap: () {
            push(const RegisterAsPerson());
          },
          child: Text(
            'لا تملك حساب ؟',
            style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
              color: Colors.blue,
            ),
          ),
        ),
        verticalSpace(90),
        AppTextButton(
          textStyle: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
            color: Colors.black,
          ),
          buttonText: 'تسجيل الدخول',
          onPressed: () {
            // push(const AgreementAcceptancePage());
          },
        ),
        verticalSpace(10),
        SocialButton(
          press: () {
            Provider.of<AuthhProvider>(context, listen: false)
                .signInWithGoogleAsPerson(context);
          },
          text: "تسجيل الدخول بواسطة جوجل",
          color: const Color(0xFF4285F4),
          icon: SvgPicture.asset(
            'assets/icons/google.svg',
          ),
        ),
      ],
    );
  }
}
