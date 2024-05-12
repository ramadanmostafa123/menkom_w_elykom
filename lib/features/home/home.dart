import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/constants/images/images.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/features/auth_as_person/login_as_person/login_as_person.dart';
import 'package:mekom_w_elykom/features/auth_as_reccycling_company/auth_as_reccycling_company.dart';
import 'package:mekom_w_elykom/features/auth_as_supplier_company.dart/login_as__supplier_company/login_as__supplier_company.dart';
import 'package:mekom_w_elykom/features/home/widgets/admin_bottom.dart';
import 'package:mekom_w_elykom/features/home/widgets/home_app_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isArabicSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const HomeApBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  ImageApp.completedLogo,
                  width: 150,
                  height: 150,
                ),
              ),
              Stack(
                children: [
                  Center(
                    child: Image.asset(
                      ImageApp.authBackground,
                      width: 500,
                      height: 500,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'register',
                          style: TextStyle(
                              fontFamily: 'Madani',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ).tr(),
                        verticalSpace(75),
                        AppTextButton(
                          textStyle:
                              AppTextstyles.textFamilyMadaniSize16Weight400,
                          buttonText: 'أفراد',
                          onPressed: () {
                            push(const LoginAsPerson());
                          },
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          textStyle:
                              AppTextstyles.textFamilyMadaniSize16Weight400,
                          buttonText: 'شركات مزوده ',
                          onPressed: () {
                            push(const LoginAsSupplierCompany());
                          },
                        ),
                        verticalSpace(40),
                        AppTextButton(
                          textStyle:
                              AppTextstyles.textFamilyMadaniSize16Weight400,
                          buttonText: 'شركات إعادة التدوير ',
                          onPressed: () {
                            push(const LoginAsRecyclingCompany());
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              verticalSpace(20),
              const AdminButton(
                //allowedEmail:  'shaden@gmail.com',
                allowedEmail: 'kareemabohamed2@gmail.com',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
