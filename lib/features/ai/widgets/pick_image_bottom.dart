import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/features/ai/ai_provider.dart';
import 'package:provider/provider.dart';

class PickImageBotttoms extends StatelessWidget {
  const PickImageBotttoms({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AiProvider>(builder: (context, ai, child) {
      return Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ai.pickImageFromCamera();
              },
              child: Image.asset(
                'assets/images/camera.png',
                height: 50,
              ),
            ),
          ),
          horisontalSpace(10),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ai.pickImageFromGallery();
              },
              child: Image.network(
                'https://img.freepik.com/premium-photo/3d-rendering-3d-illustration-mountains-sun-landscape-gallery-symbol-minimal-image-photo-jpg-file-icon_640106-403.jpg?w=740',
                height: 50,
              ),
            ),
          ),
        ],
      );
    });
  }
}
