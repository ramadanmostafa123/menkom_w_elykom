import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mekom_w_elykom/core/routing/routes.dart';
import 'package:mekom_w_elykom/features/ai/ai.dart';
import 'package:mekom_w_elykom/features/home/home.dart';
import 'package:mekom_w_elykom/features/main_screen/widgets/nav_item.dart';
import 'package:mekom_w_elykom/features/points/point.dart';
import 'package:mekom_w_elykom/features/settings/settings.dart';
import 'package:mekom_w_elykom/features/support/support.dart';
import 'package:mekom_w_elykom/features/talabat/talabat.dart';

class MainScreen extends StatefulWidget {
  final int points;
  const MainScreen({super.key, required this.points});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedTab = 0;
  // ignore: prefer_final_fields
  // static  List<Widget> _widgetOptions = <Widget>[
  //   const Home(),
  //   const ImageRecognizer(),
  //   const Settings(),
  //   const Talabati(),
  //   Points(
  //     points: widget.points,
  //   ),
  // ];
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      const Home(),
      const ImageRecognizer(),
      Settings(
        points: widget.points,
      ),
      const Talabati(),
      Points(
        points: widget.points,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return Scaffold(
      backgroundColor: Colors.white,
      body: _widgetOptions.elementAt(selectedTab),
      floatingActionButton: selectedTab == 0
          ? GestureDetector(
              onTap: () {
                //   push(const Support());
              },
              child: const SizedBox(),
              // SvgPicture.asset('assets/images/support.svg'),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavItem(
                icon: 'assets/icons/homevector.svg',
                title: 'Home',
                isSelected: selectedTab == 0,
                onTap: () {
                  _onItemTapped(0);
                }),
            NavItem(
              icon: 'assets/icons/ai2.svg',
              title: 'Ai',
              isSelected: selectedTab == 1,
              onTap: () {
                _onItemTapped(1);
              },
            ),
            NavItem(
              icon: 'assets/icons/settings.svg',
              title: 'Setting',
              isSelected: selectedTab == 2,
              onTap: () {
                _onItemTapped(2);
              },
            ),
            NavItem(
              icon: 'assets/icons/talabati.svg',
              title: 'Talabati',
              isSelected: selectedTab == 3,
              onTap: () {
                _onItemTapped(3);
              },
            ),
            NavItem(
              icon: 'assets/icons/points.svg',
              title: 'Points',
              isSelected: selectedTab == 4,
              onTap: () {
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
    );
  }
}
