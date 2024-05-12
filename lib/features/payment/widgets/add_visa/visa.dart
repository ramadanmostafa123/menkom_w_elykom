import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/issuance_order/issuance_order.dart';

class Visa extends StatelessWidget {
  const Visa({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: const Text(
              'Visa',
              style: TextStyle(
                fontFamily: 'inter',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xff091CC7),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'التحقق من عملية الشراء',
                style: AppTextstyles.textFamilyMadaniSize12Weight400,
              ),
              verticalSpace(5),
              Text(
                'للتحقق من عملية الشراء تم ارسال رمز تحقق على جوالكم المنتهى ب*******873 لتاكيد الدفع الى منكم واليكم بمبلغ 230 SARباستخدام بطاقة**********6584',
                style: AppTextstyles.textFamilyInterSize12Weight600BlackColor,
              ),
              verticalSpace(30),
              const Center(
                child: Text(
                  'VERIFICATION CODE',
                  style: TextStyle(
                    fontFamily: 'inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: Color(0xff050F6C),
                  ),
                ),
              ),
              verticalSpace(7),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(),
              ),
              verticalSpace(50),
              Center(
                child: AppTextButton(
                  buttonText: 'ارسال',
                  buttonWidth: 180.w,
                  textStyle:
                      AppTextstyles.textFamilyMadaniSize14Weight400WhiteColor,
                  onPressed: () {
                    push(const IssuanceOrder());
                  },
                  backgroundColor: const Color(0xff091CC7),
                ),
              ),
              verticalSpace(52),
              Center(
                child: Text(
                  'طلب كلمة سر جديدة ',
                  style: AppTextstyles.textFamilyInterSize12Weight600BlackColor
                      .copyWith(
                    color: const Color(0xff050F6C),
                  ),
                ),
              ),
              verticalSpace(30),
              Text(
                'Terms of Use |  ?Need help',
                style: AppTextstyles.textFamilyInterSize12Weight600BlackColor
                    .copyWith(
                  color: const Color(0xff050F6C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
