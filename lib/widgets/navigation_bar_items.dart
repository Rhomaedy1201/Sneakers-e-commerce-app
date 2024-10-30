import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_ecommers_mobile_app/pages/home_page.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/colors.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_space.dart';

class NavigationBarItems extends StatefulWidget {
  const NavigationBarItems({super.key});

  @override
  State<NavigationBarItems> createState() => _NavigationBarItemsState();
}

class _NavigationBarItemsState extends State<NavigationBarItems> {
  List<Widget> body = [
    HomePage(),
    Icon(Icons.favorite),
    Icon(Icons.favorite),
    Icon(Icons.notifications_none),
    Icon(Icons.person),
  ];

  List items = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.favorite,
    Icons.notifications_none,
    Icons.person_2_outlined,
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: body[_selectedIndex],
      bottomNavigationBar: ClipPath(
        clipper: CustomClipPath(),
        child: BottomAppBar(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            shape: const CircularNotchedRectangle(),
            shadowColor: Colors.red,
            notchMargin: 20,
            color: whiteC,
            elevation: 0,
            child: Center(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index != 2) {
                    return InkWell(
                      onTap: () {
                        print("object");
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Icon(
                          items[index],
                          size: 25,
                          color: _selectedIndex == index ? primaryC : greyC_800,
                        ),
                      ),
                    );
                  } else {
                    return spaceWidth(50);
                  }
                },
              ),
            )),
      ).animate().fade(delay: 400.ms).slideY(curve: Curves.easeOut),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(4),
        child: Icon(
          Icons.shopping_bag,
          color: whiteC,
        ),
        backgroundColor: primaryC,
      ).animate().fade(delay: 800.ms).slide(curve: Curves.easeIn),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.moveTo(0, 0);
    path.quadraticBezierTo(w * 0.5, 50, w, 0);
    path.lineTo(w, h);
    path.lineTo(0, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
