import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/colors.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_app_bar.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_space.dart';
import 'package:sneakers_ecommers_mobile_app/widgets/my_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categoryName = [
    "All Shoes",
    "Outdoor",
    "Tennis",
    "Running",
  ];
  int selectCategory = 0;

  List popularShoes = [
    {
      "title": "Nike Jordan",
      "price": "302.00",
      "image": "assets/images/nike_orange_white.png",
      "like": false,
    },
    {
      "title": "Nike Air Max",
      "price": "752.00",
      "image": "assets/images/nike_blue.png",
      "like": false,
    },
    {
      "title": "Nike Jordan",
      "price": "302.00",
      "image": "assets/images/nike_orange_white.png",
      "like": false,
    },
    {
      "title": "Nike Air Max",
      "price": "752.00",
      "image": "assets/images/nike_blue.png",
      "like": false,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteC_200,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spaceHeight(22),
            subFutures("Select Category", false),
            spaceHeight(15),
            SizedBox(
              height: 43,
              child: ListView.builder(
                itemCount: categoryName.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectCategory = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: selectCategory == index ? primaryC : whiteC,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Center(
                            child: CustomText(
                                text: categoryName[index],
                                color:
                                    selectCategory == index ? whiteC : blackC,
                                fontSize: 12,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ).animate().fade(duration: 400.ms).effect(),
                  );
                },
              ),
            ),
            spaceHeight(22),
            subFutures("New Arrivals", true),
            spaceHeight(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 95,
                decoration: BoxDecoration(
                    color: whiteC,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 5,
                          color: Color(0xFFE6E6E6),
                          offset: Offset(0, 3))
                    ]),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/bg_arrivals.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        right: 40,
                        bottom: 17,
                        child: SizedBox(
                          height: 100,
                          child: Image.asset("assets/images/shoes_purple.png"),
                        )).animate().fade(duration: 500.ms).slideY()
                  ],
                ),
              ),
            ).animate().fade(duration: 400.ms).effect(),
            spaceHeight(22),
            subFutures("Popular Shoes", true),
            spaceHeight(15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                itemCount: popularShoes.length,
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 15,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: whiteC,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0xFFE6E6E6),
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 13, left: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 115,
                                child: Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "${popularShoes[index]['image']}"),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        left: 5,
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              popularShoes[index]['like'] =
                                                  !popularShoes[index]['like'];
                                            });
                                          },
                                          child: Icon(
                                            popularShoes[index]['like']
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            size: 20,
                                            color: popularShoes[index]['like']
                                                ? redC
                                                : blackC,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                              CustomText(
                                  text: "BEST SELLER",
                                  color: primaryC,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                              spaceHeight(3),
                              CustomText(
                                  text: popularShoes[index]['title'],
                                  color: blackC_800,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: CustomText(
                                  text: "\$${popularShoes[index]['price']}",
                                  color: blackC_800,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: 35,
                              height: 37,
                              decoration: const BoxDecoration(
                                color: primaryC,
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(16),
                                    topLeft: Radius.circular(16)),
                              ),
                              child: const Icon(Icons.add,
                                  size: 20, color: whiteC),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            spaceHeight(100),
          ],
        ),
      ),
    );
  }

  Padding subFutures(String title, bool showDetail) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            color: blackC,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          showDetail
              ? CustomText(
                  text: "See all",
                  color: primaryC,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                )
              : Container(),
        ],
      ),
    );
  }
}
