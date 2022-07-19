import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/json/service.dart';
import 'package:flutter_firebase_auth/pages/food/popular_food_detail.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/widgets/big_text.dart';
import 'package:flutter_firebase_auth/widgets/icon_text_widget.dart';
import 'package:flutter_firebase_auth/widgets/small_text.dart';

class BodyFoodPgae extends StatefulWidget {
  const BodyFoodPgae({Key? key}) : super(key: key);

  @override
  State<BodyFoodPgae> createState() => _BodyFoodPgaeState();
}

class _BodyFoodPgaeState extends State<BodyFoodPgae> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 280,
          // color: Colors.red,
          child: PageView.builder(
              controller: pageController,
              itemCount: foodJson.length,
              itemBuilder: (context, position) {
                return _buildPageItem(position);
              }),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeColor: AppColors.mainColor,
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 20, top: 10),
            child: BigText(
              text: "Nổi bật",
            )),
        Container(
          height: 700,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: foodJson.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PopularFoodDetail(
                                  foodJson[index].id!.toInt(),
                                  foodJson[index].name.toString(),
                                  foodJson[index].image.toString(),
                                  foodJson[index].detail.toString(),
                                  foodJson[index].price!.toInt(),
                                  foodJson[index].sale!.toInt(),
                                  foodJson[index].star!.toInt(),
                                  foodJson[index].distance.toString(),
                                  foodJson[index].time.toString(),
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/food' +
                                    (index + 1).toString() +
                                    '.jpeg')),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              top: 5, bottom: 5, left: 15, right: 10),
                          height: 100,
                          width: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: foodJson[index].name.toString()),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.sell,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    foodJson[index].price.toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.red),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    foodJson[index].sale.toString() + " đ",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndText(
                                      icon: Icons.star,
                                      text: foodJson[index].star.toString(),
                                      iconcolor: Colors.amber),
                                  IconAndText(
                                      icon: Icons.location_on,
                                      text: foodJson[index].distance.toString(),
                                      iconcolor: AppColors.mainColor),
                                  IconAndText(
                                      icon: Icons.access_time_rounded,
                                      text: foodJson[index].time.toString(),
                                      iconcolor: Colors.orangeAccent)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          // width: ,
          height: 200,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/image/food' + (index + 1).toString() + '.jpeg')),
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue,
          ),
        ),
        Container(
          width: 260,
          height: 110,
          margin: EdgeInsets.only(left: 10, right: 10, top: 160),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xffe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                )
              ]),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: foodJson[index].name.toString()),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Wrap(
                      children: List.generate(
                        foodJson[index].star!.toInt(),
                        (index) {
                          return Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: 15,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SmallText(text: foodJson[index].star.toString()),
                    SizedBox(
                      width: 5,
                    ),
                    SmallText(text: '680 Bình luận'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconAndText(
                        icon: Icons.circle_sharp,
                        text: "Món ngon",
                        iconcolor: Colors.amber),
                    IconAndText(
                        icon: Icons.location_on,
                        text: "1.7 km",
                        iconcolor: AppColors.mainColor),
                    IconAndText(
                        icon: Icons.access_time_rounded,
                        text: "32 p",
                        iconcolor: Colors.orangeAccent)
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
