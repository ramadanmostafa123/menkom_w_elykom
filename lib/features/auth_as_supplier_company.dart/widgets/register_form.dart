import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/models/user_model.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_bottom.dart';
import 'package:mekom_w_elykom/core/widgets/app_text_form.dart';

class RegisterFormAsSupplierCompany extends StatefulWidget {
  const RegisterFormAsSupplierCompany({super.key});

  @override
  State<RegisterFormAsSupplierCompany> createState() =>
      _RegisterFormAsSupplierCompanyState();
}

class _RegisterFormAsSupplierCompanyState
    extends State<RegisterFormAsSupplierCompany> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _sectorController = TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _commercialRegister = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future<void> userCreateInFireStore({
    required String companyName,
    required String email,
    required String sectorType,
    required String uId,
    required String streetName,
    required String commercialRegister,
  }) async {
    UserModel model = UserModel(
      email: email,
      companyName: companyName,
      password: "",
      id: uId,
      sectorType: sectorType,
      streetName: streetName,
      commercialRegister: commercialRegister,
    );

    print("tokennnnnn");
    print(model.id);
    FirebaseFirestore.instance
        .collection('SupplierCompany')
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {})
        .catchError((error) {});
  }

  Future<void> _registerFct() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      _formKey.currentState!.save();
      try {
        ///register email and pass
        UserCredential user = await auth.createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim());

        ///creat in data base
        userCreateInFireStore(
          companyName: _nameController.text,
          email: _emailController.text,
          uId: user.user!.uid,
          sectorType: _sectorController.text,
          streetName: _streetController.text,
          commercialRegister: _commercialRegister.text,
        );
        print("successss");
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green, content: Text('تم التسجيل بنجاح')));
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red, content: Text(e.message.toString())));

        print("an error has been occurred xxx ${e.message}");
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(backgroundColor: Colors.red, content: Text(e.toString())));

        print("errors ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'اسم الشركة أو المؤسسة :',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _nameController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'اسم الشركة أو المؤسسة :',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an Company name';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(30),
          const Text(
            'السجل التجارى : ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _commercialRegister,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'السجل التجارى',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an Commercial Register';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(30),
          const Text(
            ' البريد الالكترونى : ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _emailController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'البريد الالكترونى',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an email';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(30),
          const Text(
            ' كلمة المرور : ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
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
                return 'Please enter an password';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(30),
          const Text(
            ' نوع القطاع : ',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _sectorController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: 'تعليمى ',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an sector';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(30),
          const Text(
            ' اسم الحى أو الشارع :',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          verticalSpace(5),
          AppTextFormField(
            controller: _streetController,
            inputTextStyle:
                AppTextstyles.textFamilyMadaniSize16Weight400.copyWith(
              color: Colors.black,
            ),
            hintText: ' اسم الحى أو الشارع',
            hintStyle: AppTextstyles.font14DarkBlueMedium.copyWith(
              fontFamily: 'Madani',
              color: const Color.fromRGBO(0, 0, 0, 0.5),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter an street';
              } else {
                return null;
              }
            },
          ),
          verticalSpace(50),
          Center(
            child: AppTextButton(
              buttonWidth: 300,
              buttonText: 'انشاء حساب',
              textStyle:
                  AppTextstyles.textFamilyMadaniSize14Weight400WhiteColor,
              onPressed: () {
                _registerFct();
              },
            ),
          )
        ],
      ),
    );
  }
}
