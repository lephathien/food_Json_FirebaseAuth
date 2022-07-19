import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/json/foodjson.dart';
import 'package:flutter_firebase_auth/json/service.dart';
import 'package:flutter_firebase_auth/pages/food/popular_food_detail.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/widgets/big_text.dart';
import 'package:flutter_firebase_auth/widgets/small_text.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

import 'body_food_page.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  double TextFieldWidth = 45;
  bool clickSearch = true;
  TextEditingController Controller = TextEditingController();
  List<FoodJson> foodJsonS = foodJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(
                          text: "TP HCM",
                          color: AppColors.mainColor,
                        ),
                        Row(
                          children: [
                            SmallText(
                              text: "Quận 1",
                            ),
                            Icon(Icons.arrow_drop_down_outlined),
                          ],
                        ),
                      ],
                    ),
                    /* AnimSearchBar(
                      width: 250,
                      textController: textController,
                      onSuffixTap: () {
                        setState(() {
                          textController.clear();
                        });
                      },
                      color: AppColors.mainColor,
                      helpText: "Tìm món hàng",
                      autoFocus: true,
                      closeSearchOnSuffixTap: true,
                      //animationDurationInMilli: 500,
                      rtl: true,
                    ), */
                    clickSearch
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                clickSearch = false;
                              });
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              child: const Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.mainColor),
                            ),
                          )
                        : Container(
                            height: 45,
                            width: 200,
                            child: TextField(
                              controller: Controller,
                              onChanged: searchfood,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                    borderRadius: BorderRadius.circular(100)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.green),
                                    borderRadius: BorderRadius.circular(100)),
                                filled: true,
                                fillColor: AppColors.mainColor,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      clickSearch = true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            clickSearch
                ? SizedBox(
                    height: 10,
                  )
                : Container(
                    height: 400,
                    child: ListView.builder(
                        itemCount: foodJsonS.length,
                        itemBuilder: (context, index) {
                          final foodJsonM = foodJsonS[index];
                          return ListTile(
                            leading: Image.asset(
                              foodJsonM.image.toString(),
                              width: 50,
                              height: 60,
                            ),
                            title: Text(foodJsonM.name.toString()),
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
                          );
                        }),
                  ),
            clickSearch
                ? Expanded(child: SingleChildScrollView(child: BodyFoodPgae()))
                : SizedBox(
                    height: 10,
                  ),
          ],
        ),
      ),
    );
  }

  void searchfood(String query) {
    final suggestions = foodJson.where((FoodJson) {
      final name = FoodJson.name?.toLowerCase();
      final input = query.toLowerCase();
      return name!.contains(input);
    }).toList();
    setState(() => foodJsonS = suggestions);
  }
}
