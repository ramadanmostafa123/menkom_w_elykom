import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';

class IssuanceOrder extends StatelessWidget {
  const IssuanceOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 180.w,
                    child: Text(
                      'تم اصدار طلبك بنجاح وسيتم ارسال فريقنا في اسرع وقت',
                      style: AppTextstyles.textFamilyMadaniSize16Weight400,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(20),
                  Image.asset('assets/images/route 1.png'),
                ],
              ),
            ),
          )),
    );
  }
}
