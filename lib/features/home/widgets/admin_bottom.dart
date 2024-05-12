// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/main_screen/main_screen.dart';

class AdminButton extends StatelessWidget {
  final String allowedEmail; // البريد الإلكتروني المسموح له بالدخول كمسؤول

  const AdminButton({super.key, required this.allowedEmail});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      buttonWidth: 200.w,
      buttonText: 'التسجيل كمسؤول',
      textStyle: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
        color: Colors.white,
      ),
      onPressed: () async {
        print(allowedEmail);
        try {
          GoogleSignIn googleSignIn = GoogleSignIn();
          // قم بتسجيل الدخول باستخدام حساب Google
          GoogleSignInAccount? googleUser = await googleSignIn.signIn();
          if (googleUser != null) {
            // تحقق من أن البريد الإلكتروني المسترجع مطابق للبريد المسموح به
            if (googleUser.email == allowedEmail) {
              // إذا كان البريد الإلكتروني متطابقًا، يمكنك تنفيذ الوصول كمسؤول
              // هنا يمكنك تنفيذ الإجراءات التي ترغب في تنفيذها للمسؤول
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم تنشيط حالة المسؤول.'),
                ),
              );
              push(const MainScreen(
                points: 0,
              ));
            } else {
              print(googleUser.email);
              print('//////////////////////');
              await googleSignIn.signOut();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'لا يمكن الوصول. يجب أن يكون البريد الإلكتروني للأدمن.',
                  ),
                ),
              );
            }
          } else {
            // إذا لم يكن المستخدم مسجل الدخول، يمكنك توجيهه لتسجيل الدخول أولاً
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('يرجى تسجيل الدخول أولاً.'),
              ),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('حدث خطأ غير متوقع: $e'),
            ),
          );
        }
      },
    );
  }
}
