import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/pages/cart/cart_page.dart';
import 'package:flutter_firebase_auth/utils/colors.dart';
import 'package:flutter_firebase_auth/utils/global_var.dart';
import 'package:flutter_firebase_auth/widgets/app_icon.dart';
import 'package:flutter_firebase_auth/widgets/big_text.dart';
import 'package:flutter_firebase_auth/widgets/expandable_text.dart';
import 'package:flutter_firebase_auth/widgets/icon_text_widget.dart';
import 'package:flutter_firebase_auth/widgets/small_text.dart';

class PopularFoodDetail extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  final String detail;
  final int price;
  final int sale;
  final int star;
  final String distance;
  final String time;

  PopularFoodDetail(this.id, this.name, this.image, this.detail, this.price,
      this.sale, this.star, this.distance, this.time);

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  late int soLuong = 1;
  late final int tinhTien = widget.sale.toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(widget.image.toString())),
              ),
            ),
          ),
          Positioned(
              top: 40,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ),
                        );
                      },
                      child: AppIcon(icon: Icons.shopping_cart_outlined))
                ],
              )),
          Positioned(
              top: 39,
              right: 19,
              child: idDatHang.isEmpty
                  ? SizedBox(
                      height: 1,
                    )
                  : Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.red),
                      child: Text(
                        idDatHang.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ))),
          Positioned(
              top: 260,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: widget.name.toString()),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Wrap(
                          children: List.generate(
                            widget.star.toInt(),
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
                        SmallText(text: widget.star.toString()),
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
                            text: "Tuyệt vời",
                            iconcolor: Colors.amber),
                        IconAndText(
                            icon: Icons.location_on,
                            text: widget.distance.toString(),
                            iconcolor: AppColors.mainColor),
                        IconAndText(
                            icon: Icons.access_time_rounded,
                            text: widget.time.toString(),
                            iconcolor: Colors.orangeAccent)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BigText(
                      text: "Giới thiệu",
                      size: 17,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                            text:
                                "Vùng đất Tây Nguyên khắc nghiệt lại được thiên nhiên ban tặng nguồn thực phẩm vô cùng quý giá là heo rừng - nguyên liệu hảo hạng tạo nên nét ẩm thực rất riêng mang tên “ đặc sản phố núi”. Bạn sẽ được thưởng thức Heo rừng nướng riềng mẻ đúng chất Tây Nguyên khi đến với ẩm thực Vạn Phát. Thịt heo rừng đặc biệt săn chắc và thơm ngon, nhiều nạc, ít mỡ, lớp da dày nhưng giòn. Heo rừng ăn những thức ăn tự nhiên như rau củ không qua quá trình nuôi công nghiệp nên rất an toàn và giàu dinh dưỡng. Trong heo rừng ngoài chất đạm và các protein còn chứa một hàm lượng không nhỏ vitamin A, C mà hiếm có loại thịt động vật nào có được. Riềng có vị cay thơm, tính ấm vào hai kinh tỳ và vị, có tác dụng ôn trung, giảm đau, tiêu thức ăn, ấm bụng nên rất tốt cho hệ tiêu hóa.  Ngoài ra riềng còn  có tác dụng kháng khuẩn, chữa ho, viêm họng và bệnh phong thấp.Cơm mẻ có hương vị đặc biệt và rất bổ dưỡng. Trong cơm mẻ chứa nhiều đạm, vitamin, các lợi khuẩn do quá trình lên men nên không chỉ tương trợ cho một số món ăn trở nên thơm ngon, lạ miệng mà còn có những lợi ích nhất định đối với sức khỏe con người. "),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
      ////////////////////////////////////////
      bottomNavigationBar: Container(
        height: 80,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          if (soLuong > 1) soLuong = soLuong - 1;
                        });
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(
                    width: 10,
                  ),
                  BigText(text: soLuong.toString()),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          soLuong = soLuong + 1;
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  saleDatHang.add(widget.sale);
                  idDatHang.add(widget.id);
                  slDathang.add(soLuong);
                });
              },
              child: Container(
                height: 45,
                padding: EdgeInsets.all(10),
                //  margin: EdgeInsets.all(),
                child: Center(
                  child: Text(
                    (tinhTien * soLuong).toString() + "đ  |  Thêm vào giỏ ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
