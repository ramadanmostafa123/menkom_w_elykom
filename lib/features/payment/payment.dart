import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/payment/widgets/add_visa/add_visa.dart';
import 'package:mekom_w_elykom/features/payment/widgets/amount.dart';
import 'package:mekom_w_elykom/features/payment/widgets/payment_method.dart';
import 'package:mekom_w_elykom/features/payment/widgets/products.dart';
import 'package:mekom_w_elykom/features/payment/widgets/shipping_address.dart';
import 'package:mekom_w_elykom/features/payment/widgets/shipping_method.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.green,
        title: Center(
          child: Text(
            'الدفع',
            style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ShippingAddress(),
              verticalSpace(20),
              const ShippingMethod(),
              verticalSpace(20),
              const PaymentMethod(),
              verticalSpace(20),
              const Products(),
              verticalSpace(20),
              const Amount(),
              verticalSpace(20),
              AppTextButton(
                backgroundColor: AppColors.mainColor,
                buttonText: 'إصدار الطلب',
                textStyle:
                    AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.white,
                ),
                onPressed: () {
                  push(const AddVisa());
                },
                buttonHeight: 50,
                buttonWidth: 200.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
