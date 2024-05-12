// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/extensions/num_extensions.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController _textController = TextEditingController();

  String selectedOption = 'اختر';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'الدعم',
                      style: AppTextstyles.textFamilyMadaniSize14Weight400,
                    ),
                  ),
                  verticalSpace(50),
                  Text('نوع الرسالة',
                      style: AppTextstyles.textFamilyMadaniSize12Weight400),
                  verticalSpace(5),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        selectedOption,
                        style: AppTextstyles
                            .textFamilyInterSize12Weight600BlackColor,
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            'شكوى',
                            style: AppTextstyles
                                .textFamilyInterSize12Weight600BlackColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedOption = 'شكوى';
                            });
                          },
                        ),
                        verticalSpace(10),
                        ListTile(
                          title: Text(
                            'اقتراح',
                            style: AppTextstyles
                                .textFamilyInterSize12Weight600BlackColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedOption = 'اقتراح';
                            });
                          },
                        ),
                        verticalSpace(10),
                        ListTile(
                          title: Text(
                            'رأى',
                            style: AppTextstyles
                                .textFamilyInterSize12Weight600BlackColor,
                          ),
                          onTap: () {
                            setState(() {
                              selectedOption = 'رأى';
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(80),
                  Text('الرسالة',
                      style: AppTextstyles.textFamilyMadaniSize12Weight400),
                  verticalSpace(5),
                  AppTextFormField(
                    controller: _textController,
                    maxLines: 5,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
                    hintText: 'اكتب رسالتك هنا',
                    validator: (value) {},
                  ),
                  verticalSpace(30),
                  Center(
                    child: AppTextButton(
                      buttonWidth: 200.w,
                      buttonText: 'ارسال',
                      textStyle: AppTextstyles.textFamilyMadaniSize16Weight400,
                      onPressed: () async {
                        final text = _textController.text;

                        // إضافة النص إلى قاعدة بيانات Firebase

                        if (_textController.text.isNotEmpty) {
                          final firestore = FirebaseFirestore.instance;
                          try {
                            await firestore.collection('messages').add({
                              'text': text,
                            });
                          } catch (e) {
                            print('Error adding message: $e');
                          }
                          _textController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColors.mainColor,
                              content:
                                  Text('Your message submitted successfully!'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColors.appRed,
                              content: Text('Please enter your message!'),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
