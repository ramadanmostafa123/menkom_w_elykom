import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/ai/ai.dart';
import 'package:mekom_w_elykom/features/ai/ai_provider.dart';
import 'package:provider/provider.dart';

class ProcessingResults extends StatelessWidget {
  const ProcessingResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'نتيجة المعالجة',
          style: AppTextstyles.textFamilyMadaniSize16Weight400,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<AiProvider>(builder: (context, ai, child) {
          String enteredNumber = ai.controllerText.text;
          print('/////////////////////////');
          print(double.parse(enteredNumber));
          return Column(
            children: [
              verticalSpace(50),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                  horisontalSpace(5),
                  Text(
                    'الوزن التقريبى : ',
                    style: AppTextstyles.textFamilyMadaniSize16Weight400,
                  ),
                  Expanded(
                    child: Text(
                      '${ai.controllerText.text} Kg ',
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: AppColors.thirdColor,
                      ),
                    ),
                    //   Text('${ai.weight.toStringAsFixed(2)}',
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                  horisontalSpace(5),
                  Text(
                    'الفئة : ',
                    style: AppTextstyles.textFamilyMadaniSize16Weight400,
                  ),
                  Expanded(
                    child: Column(children: <Widget>[
                      ...(ai.recognitions != null
                          ? ai.recognitions.map(
                              (recognition) {
                                return Text(
                                  '${recognition['label']} (نسبتها فى الصورة تقريباً: ${recognition['confidence'].toStringAsFixed(2)})',
                                  style: AppTextstyles
                                      .textFamilyMadaniSize12Weight400
                                      .copyWith(
                                    color: AppColors.thirdColor,
                                  ),
                                );
                              },
                            ).toList()
                          : []),
                    ]),
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.black,
                  ),
                  horisontalSpace(5),
                  Text(
                    'هل العينة مقبولة : ',
                    style: AppTextstyles.textFamilyMadaniSize16Weight400,
                  ),
                  if (double.tryParse(enteredNumber) != null &&
                      double.parse(enteredNumber) < 5)
                    Expanded(
                      child: Text(
                        'لم تصل الى الحد المطلوب من الوزن',
                        style: AppTextstyles.textFamilyMadaniSize12Weight400
                            .copyWith(
                          color: AppColors.thirdColor,
                        ),
                      ),
                      //  Text('${ai.weight.toStringAsFixed(2)}',
                    )
                  else
                    Expanded(
                      child: Text(
                        'نعم تم استيفاء الشروط ',
                        style: AppTextstyles.textFamilyMadaniSize12Weight400
                            .copyWith(
                          color: AppColors.thirdColor,
                        ),
                      ),
                      //  Text('${ai.weight.toStringAsFixed(2)}',
                    ),
                ],
              ),
              if (double.tryParse(enteredNumber) != null &&
                  double.parse(enteredNumber) < 5)
                Column(
                  children: [
                    verticalSpace(50),
                    Text(
                      'بإمكانك اضافة نوع اخر من المخلفات أو الانتظار لتصل الى الحد المطلوب من الوزن',
                      style: AppTextstyles.textFamilyMadaniSize14Weight400,
                    ),
                    verticalSpace(80),
                    Image.asset('assets/images/x.png'),
                    verticalSpace(80),
                    Text(
                      'أضافة منتج آخر ',
                      style: AppTextstyles.textFamilyMadaniSize14Weight400,
                    ),
                    verticalSpace(10),
                    InkWell(
                        onTap: () {
                          push(const ImageRecognizer());
                        },
                        child: Image.asset('assets/images/Add New.png')),
                  ],
                )
              else
                Column(
                  children: [
                    verticalSpace(50),
                    Text(
                      'سيتم ارسالها لمؤسسة لإعادة التدوير',
                      style: AppTextstyles.textFamilyMadaniSize14Weight400,
                    ),
                    verticalSpace(80),
                    Image.asset(
                        'assets/images/Success Micro-interaction 1.png'),
                    verticalSpace(80),
                    Text(
                      'شكراً على تعاونكم ',
                      style: AppTextstyles.textFamilyMadaniSize14Weight400,
                    ),
                  ],
                )
            ],
          );
        }),
      ),
    );
  }
}
