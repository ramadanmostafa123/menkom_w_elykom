import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'الاسم رباعى : ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        verticalSpace(5),
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'الاسم رباعى',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(30),
        const Text(
          'البريد الالكتروني : ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        verticalSpace(5),
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
        const Text(
          'رقم الهاتف : ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        verticalSpace(5),
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'رقم الهاتف',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(30),
        const Text(
          'الحى / اسم الشارع : ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        verticalSpace(5),
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'الحى / اسم الشارع',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(30),
        const Text(
          'رقم العمارة : ',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        verticalSpace(5),
        AppTextFormField(
          inputTextStyle:
              AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
          hintText: 'رقم العمارة',
          hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
            fontFamily: 'Madani',
            color: const Color.fromRGBO(0, 0, 0, 0.5),
          ),
          validator: (value) {},
        ),
        verticalSpace(50),
        Center(
          child: AppTextButton(
              buttonWidth: 300,
              buttonText: 'انشاء حساب',
              textStyle:
                  AppTextstyles.textFamilyMadaniSize14Weight400WhiteColor,
              onPressed: () {}),
        )
      ],
    );
  }
}
