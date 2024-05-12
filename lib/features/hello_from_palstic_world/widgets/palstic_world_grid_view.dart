import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/hello_model.dart';
import 'package:mekom_w_elykom/features/salla/salla.dart';
import 'package:mekom_w_elykom/features/salla/salla_provider.dart';
import 'package:provider/provider.dart';

class PalsticWorldGridView extends StatelessWidget {
  const PalsticWorldGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SallaProvider>(builder: (context, salla, child) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemCount: 4,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return BuildPlasticWorldGridViewItem(
              model: salla.helloList[index],
            );
          });
    });
  }
}

class BuildPlasticWorldGridViewItem extends StatelessWidget {
  final HelloModel model;
  const BuildPlasticWorldGridViewItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Consumer<SallaProvider>(builder: (context, salla, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Stack(
          children: [
            Container(
              //   margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "رقم المنتج : #${model!.id.toString()}",
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: const Color(0xff56864B),
                      ),
                    ),
                    verticalSpace(5),
                    Text(
                      " نوع المنتج: ${model.name}",
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: const Color(0xff56864B),
                      ),
                    ),
                    verticalSpace(5),
                    Text(
                      "وصف المنتج:  ${model.details}",
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: const Color(0xff56864B),
                      ),
                    ),
                    verticalSpace(5),
                    Text(
                      "وزن المنتج التقريبي: ${model.weight}kg  ",
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: const Color(0xff56864B),
                      ),
                    ),
                    verticalSpace(5),
                    Text(
                      "السعر : ${model.price} ريال",
                      style: AppTextstyles.textFamilyMadaniSize12Weight400
                          .copyWith(
                        color: const Color(0xff56864B),
                      ),
                    ),
                    verticalSpace(40),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              right: 0,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  salla.addToList(model);
                  print(salla.sallaList);
                  push(const Salla());
                },
                child: Image.asset('assets/images/Add New.png'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
