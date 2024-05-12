import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';
import 'package:mekom_w_elykom/features/payment/widgets/add_visa/visa.dart';

class AddVisa extends StatefulWidget {
  const AddVisa({super.key});

  @override
  State<AddVisa> createState() => _AddVisaState();
}

class _AddVisaState extends State<AddVisa> {
  bool isValueTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.green,
        title: Text(
          'الدفع',
          style: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(50),
            Text(
              'رقم البطاقة : ',
              style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                color: Colors.black,
              ),
            ),
            verticalSpace(5),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
              child: AppTextFormField(
                inputTextStyle:
                    AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.black,
                ),
                hintText: 'الرقم المكتوب على البطاقة',
                hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
                  fontFamily: 'Madani',
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
                validator: (value) {},
              ),
            ),
            verticalSpace(30),
            Text(
              'الإسم على البطاقة :',
              style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                color: Colors.black,
              ),
            ),
            verticalSpace(5),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ]),
              child: AppTextFormField(
                inputTextStyle:
                    AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                  color: Colors.black,
                ),
                hintText: 'الإسم المكتوب على البطاقة',
                hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
                  fontFamily: 'Madani',
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                ),
                validator: (value) {},
              ),
            ),
            verticalSpace(30),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'تاريخ الانتهاء :',
                        style: AppTextstyles.textFamilyMadaniSize14Weight400
                            .copyWith(
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(5),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                        child: AppTextFormField(
                          inputTextStyle: AppTextstyles
                              .textFamilyMadaniSize16Weight400
                              .copyWith(
                            color: Colors.black,
                          ),
                          hintText: 'شهر / سنه ',
                          hintStyle:
                              AppTextstyles.font14DarkBlueMedium.copyWith(
                            fontFamily: 'Madani',
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          validator: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                horisontalSpace(30),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'رمز الأمان :',
                        style: AppTextstyles.textFamilyMadaniSize14Weight400
                            .copyWith(
                          color: Colors.black,
                        ),
                      ),
                      verticalSpace(5),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                        child: AppTextFormField(
                          inputTextStyle: AppTextstyles
                              .textFamilyMadaniSize16Weight400
                              .copyWith(
                            color: Colors.black,
                          ),
                          hintText: '3 أرقام خلف البطاقة',
                          hintStyle:
                              AppTextstyles.font14DarkBlueMedium.copyWith(
                            fontFamily: 'Madani',
                            color: const Color.fromRGBO(0, 0, 0, 0.5),
                          ),
                          validator: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isValueTapped,
                  onChanged: (onChanged) {
                    setState(() {
                      isValueTapped = !isValueTapped;
                    });
                  },
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                ),
                horisontalSpace(20),
                Text(
                  'هل تريد حفظ بيانات الباقة ؟',
                  style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            verticalSpace(50),
            AppTextButton(
              backgroundColor: AppColors.mainColor,
              buttonWidth: 200.w,
              buttonText: 'إضافة البطاقة',
              textStyle: AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
                color: Colors.black,
              ),
              onPressed: () {
                push(const Visa());
              },
            ),
          ],
        ),
      ),
    );
  }
}
