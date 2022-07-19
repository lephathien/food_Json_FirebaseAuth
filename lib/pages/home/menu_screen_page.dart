import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/json/foodjson.dart';
import 'package:flutter_firebase_auth/pages/cart/cart_page.dart';
import 'package:flutter_firebase_auth/pages/history_buy/history_buy.dart';
import 'package:flutter_firebase_auth/pages/home/main_food_page.dart';
import 'package:flutter_firebase_auth/pages/login/login.dart';

import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:http/http.dart' as http;

class MenuScreenPage extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<MenuScreenPage> {
  final List _screens = [
    MainFoodPage(),
    HistoryBuy(),
    CartPage(),
    Login(),
    // MainFoodPage(),
    //  MainFoodPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        elevation: 0.0,
        items: [Icons.home, Icons.history, Icons.shopping_cart, Icons.person]
            .asMap()
            .map((key, value) => MapEntry(
                  key,
                  BottomNavigationBarItem(
                    title: Text(''),
                    icon: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 16.0,
                      ),
                      decoration: BoxDecoration(
                        color: _currentIndex == key
                            ? AppColors.mainColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Icon(value),
                    ),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }
}
