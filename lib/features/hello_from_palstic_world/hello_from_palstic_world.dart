import 'package:flutter/material.dart';
import 'package:mekom_w_elykom/core/helpers/spacing.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/core/theming/colors.dart';
import 'package:mekom_w_elykom/core/theming/text_styles.dart';
import 'package:mekom_w_elykom/features/hello_from_palstic_world/widgets/palstic_world_grid_view.dart';
import 'package:mekom_w_elykom/features/salla/salla.dart';

class HelloFromPalsticWorld extends StatefulWidget {
  const HelloFromPalsticWorld({super.key});

  @override
  State<HelloFromPalsticWorld> createState() => _HelloFromPalsticWorldState();
}

class _HelloFromPalsticWorldState extends State<HelloFromPalsticWorld> {
  String drawerTitle = 'البلاستيك';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'أهلا بكم فى عالم البلاستيك',
          style: AppTextstyles.textFamilyMadaniSize14Weight400.copyWith(
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              push(const Salla());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_checkout_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.greyLight,
              ),
              child: Text(
                drawerTitle,
              ),
            ),
            ListTile(
              title: const Text('معادن'),
              onTap: () {
                setState(() {
                  drawerTitle = 'معادن';
                });
                //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('كرتون ورق'),
              onTap: () {
                setState(() {
                  drawerTitle = 'كرتون ورق';
                });
                //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('مخلفات طعام'),
              onTap: () {
                setState(() {
                  drawerTitle = 'مخلفات طعام ';
                });
                //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('ملابس وأقمشة'),
              onTap: () {
                setState(() {
                  drawerTitle = 'ملابس وأقمشة';
                });
                //  Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('زجاج'),
              onTap: () {
                setState(() {
                  drawerTitle = 'زجاج';
                });
                //  Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalSpace(50),
          const PalsticWorldGridView(),
        ],
      ),
    );
  }
}
