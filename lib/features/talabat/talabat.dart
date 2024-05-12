import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/talabat/widgets/completed_orders.dart';
import 'package:mekom_w_elykom/features/talabat/widgets/current_orders.dart';
import 'package:mekom_w_elykom/features/talabat/widgets/rejected_orders.dart';

class Talabati extends StatefulWidget {
  const Talabati({
    super.key,
  });

  @override
  State<Talabati> createState() => _TalabatiState();
}

class _TalabatiState extends State<Talabati> {
  bool isfirstTabed = true;
  bool islastTaabed = false;
  bool isRejectedBottomTabed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '   الطلبات   ',
          style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   ImageApp.background,
          //   fit: BoxFit.fitWidth,
          //   width: double.infinity,
          //   height: double.infinity,
          //   alignment: Alignment.topCenter,
          // ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: AppTextButton(
                          buttonHeight: 56,
                          buttonWidth: double.infinity,
                          buttonText: 'الحالية',
                          backgroundColor: isfirstTabed
                              ? AppColors.mainColor
                              : AppColors.greyLight,
                          textStyle: AppTextstyles
                              .textFamilyMadaniSize14Weight400
                              .copyWith(
                            color: isfirstTabed ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isfirstTabed = true;
                              islastTaabed = false;
                            });
                          },
                        ),
                      ),
                      horisontalSpace(5),
                      Expanded(
                        child: AppTextButton(
                          buttonHeight: 56,
                          buttonWidth: double.infinity,
                          backgroundColor: islastTaabed
                              ? AppColors.mainColor
                              : AppColors.greyLight,
                          buttonText: 'المنجزة',
                          textStyle: AppTextstyles
                              .textFamilyMadaniSize14Weight400
                              .copyWith(
                            color: islastTaabed ? Colors.black : Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              islastTaabed = true;
                              isfirstTabed = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  AnimatedCrossFade(
                    firstChild: const CurrentOrders(),
                    secondChild: const CompletedOrders(),
                    crossFadeState: isfirstTabed
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 450),
                  ),
                  verticalSpace(50),
                  AppTextButton(
                    buttonHeight: 56,
                    buttonWidth: 180.w,
                    buttonText: 'المرفوضة',
                    backgroundColor: isRejectedBottomTabed
                        ? AppColors.mainColor
                        : AppColors.greyLight,
                    textStyle:
                        AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                      color: isRejectedBottomTabed ? Colors.black : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        isRejectedBottomTabed = !isRejectedBottomTabed;
                      });
                    },
                  ),
                  verticalSpace(20),
                  isRejectedBottomTabed ? const RejectedOrders() : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
