import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/models/user_model.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';
import 'package:mekom_w_elykom/core/widgets/social_app.dart';
import 'package:mekom_w_elykom/features/auth_as_person/auth_provider.dart';
import 'package:mekom_w_elykom/features/auth_as_reccycling_company/recycle_register/recyle_register.dart';
import 'package:mekom_w_elykom/features/donations/donations.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/hello_from_palstic_world.dart';
import 'package:provider/provider.dart';

class LoginRecyclingCompanyForm extends StatefulWidget {
  const LoginRecyclingCompanyForm({super.key});

  @override
  State<LoginRecyclingCompanyForm> createState() =>
      _LoginRecyclingCompanyFormState();
}

class _LoginRecyclingCompanyFormState extends State<LoginRecyclingCompanyForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future<void> _loginFct() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      try {
        await auth.signInWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text('تم تسجيل الدخول بنجاح')));
        push(const HelloFromPalsticWorld());
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(e.message.toString())));

        print("error has been occurred ${e.message}");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(e.toString())));
        print("errorssss ${e.toString()}");
      } finally {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            controller: _emailController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'البريد الالكتروني',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter an Email';
              }
            },
          ),
          verticalSpace(30),
          AppTextFormField(
            controller: _passwordController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'كلمة المرور',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'please enter an Email';
              }
            },
          ),
          verticalSpace(10),
          Text(
            'هل نسيت كلمة المرور ؟',
            style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
              color: Colors.blue,
            ),
          ),
          verticalSpace(10),
          InkWell(
            onTap: () {
              push(const RegisterAsRecyclingCompany());
            },
            child: Text(
              'لا تملك حساب ؟',
              style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
                color: Colors.blue,
              ),
            ),
          ),
          verticalSpace(90),
          AppTextButton(
            textStyle: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
              color: Colors.black,
            ),
            buttonText: 'تسجيل الدخول',
            onPressed: () {
              _loginFct();
              //  push(const AgreementAcceptancePage());
            },
          ),
          verticalSpace(20),
          SocialButton(
            press: () {
              // GoogleSignIn googleSignIn = GoogleSignIn();
              // googleSignIn.disconnect();

              Provider.of<AuthhProvider>(context, listen: false)
                  .signInWithGoogleAsResyclyingCompany(context);
            },
            text: "تسجيل الدخول بواسطة جوجل",
            color: const Color(0xFF4285F4),
            icon: SvgPicture.asset(
              'assets/icons/google.svg',
            ),
          ),
        ],
      ),
    );
  }
}
