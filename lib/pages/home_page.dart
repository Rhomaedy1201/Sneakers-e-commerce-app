import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/colors.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_space.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC_200,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          clipBehavior: Clip.none,
          backgroundColor: whiteC_200,
          title: SizedBox(
            height: 45,
            child: Image.asset("assets/icons/logo.png"),
          ),
          centerTitle: true,
          leading: Image.asset(
            "assets/icons/icon_drawer.png",
          ),
          leadingWidth: 30,
          actions: [
            Stack(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: whiteC,
                  ),
                  child: Center(
                    child: Image.asset("assets/icons/bag.png", height: 24),
                  ),
                ),
                Positioned(
                  right: 2,
                  top: 3,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: redC,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
            spaceWidth(20)
          ],
        ),
      ),
      // body: Center(
      //   child: Text("HELLO")
      //       .animate()
      //       .fade(delay: 500.ms)
      //       .scaleY(curve: Curves.easeIn),
      // ),
    );
  }
}
