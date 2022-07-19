import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/json/service.dart';
import 'package:flutter_firebase_auth/pages/home/menu_screen_page.dart';
import 'package:flutter_firebase_auth/pages/login/info.dart';
import 'package:flutter_firebase_auth/pages/login/login.dart';
import 'package:flutter_firebase_auth/pages/login/signup.dart';
import 'package:flutter_firebase_auth/utils/global_var.dart';
import 'package:flutter_firebase_auth/widgets/app_icon.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void tinhTien() {
    tongTien = 0;
    for (var i = 0; i < idDatHang.length; i++) {
      tongTien = tongTien + saleDatHang[i].toInt() * slDathang[i].toInt();
      print(tongTien);
    }
  }

  @override
  void initState() {
    super.initState();
    tinhTien();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 10, left: 10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuScreenPage(),
                      ),
                    );
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    backgroudColor: Colors.white,
                  )),
            ),
            Center(
                child: Image.asset(
              "assets/image/chef.png",
              height: 100,
            )),
            idDatHang.isEmpty
                ? Text("Bạn chưa bỏ vào giỏ món hàng nào !")
                : Text("Danh sách các món trong giỏ hàng"),
            Container(
                height: 400,
                padding: EdgeInsets.all(5),
                child: ListView.builder(
                    itemCount: idDatHang.length,
                    itemBuilder: (BuildContext, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 9,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      foodJson[idDatHang[index] - 1]
                                          .image
                                          .toString(),
                                      width: 100,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            foodJson[idDatHang[index] - 1]
                                                .name
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text("Giá: " +
                                              foodJson[idDatHang[index] - 1]
                                                  .price
                                                  .toString()),
                                          Text("Khuyến mãi: " +
                                              foodJson[idDatHang[index] - 1]
                                                  .sale
                                                  .toString()),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (slDathang[index] == 1) {
                                            idDatHang.removeAt(index);
                                            slDathang.removeAt(index);
                                            saleDatHang.removeAt(index);
                                          } else
                                            slDathang[index] =
                                                slDathang[index] - 1;
                                          tinhTien();
                                        });
                                      },
                                      child: Text(
                                        "-  ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(slDathang[index].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          slDathang[index] =
                                              slDathang[index] + 1;
                                          tinhTien();
                                        });
                                      },
                                      child: Text(" +",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      );
                    })),
            idDatHang.isEmpty
                ? SizedBox(
                    width: 10,
                  )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("------------------------------------------"),
                        Text("Tiền món ăn: " + tongTien.toString()),
                        Text("Phí vận chuyển: 20000 đ"),
                        Text(
                          "Tổng tiền: " + (tongTien + 20000).toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (isLogin == true) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Info(),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                                width: 300,
                                child: Center(child: Text("Đặt hàng"))))
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
