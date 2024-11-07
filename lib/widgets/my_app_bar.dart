import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/colors.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_space.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      backgroundColor: whiteC_200,
      shadowColor: whiteC_200,
      elevation: 0,
      surfaceTintColor: whiteC_200,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 30,
            child: Image.asset("assets/icons/icon_drawer.png"),
          ).animate().fade(delay: 400.ms),
          SizedBox(
            height: 45,
            child: Image.asset("assets/icons/logo.png"),
          ).animate().fade(delay: 200.ms),
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
                  child: Image.asset(
                    "assets/icons/bag.png",
                    height: 24,
                  ),
                ),
              ),
              Positioned(
                right: 2,
                top: 3,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: redC,
                  ),
                ),
              )
            ],
          ).animate().fade(delay: 300.ms)
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                        color: whiteC,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.search_sharp,
                              size: 24,
                            ),
                            spaceWidth(10),
                            CustomText(
                                text: "Loking for shoes",
                                color: greyC_800,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                      ),
                    ),
                  ).animate().fade(delay: 300.ms),
                  spaceWidth(15),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      height: 52,
                      decoration: BoxDecoration(
                          color: primaryC,
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/icons/search_filter.png"),
                              scale: 2)),
                    ),
                  ).animate().fade(delay: 400.ms)
                ],
              ),
            ),
            spaceHeight(10)
          ],
        ),
      ),
    );
  }
}
