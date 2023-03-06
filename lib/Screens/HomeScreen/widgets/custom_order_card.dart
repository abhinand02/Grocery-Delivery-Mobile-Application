import 'package:flutter/material.dart';
import 'package:grocery_delivery_mobile_app/Screens/OrderDetails/map_page.dart';
import '../../../Constant/colors.dart';
import '../../../Constant/height_width.dart';
import '../../../Constant/textstyle.dart';

class CustomOrderDetailsCard extends StatelessWidget {
  final int? index;
  final bool id;
  CustomOrderDetailsCard({super.key, required this.index, this.id = false});

  List imageList = ['assets/images/image1.jpeg', 'assets/images/image2.jpeg'];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MapPage()));
      },
      child: Card(
        shadowColor: maincolor,
        elevation: id ? 0 : 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(12),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image(
                  image: AssetImage(
                    'assets/images/image$index.jpeg',
                  ),
                  fit: BoxFit.cover,
                  height: 65,
                  width: 65,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                id
                    ? Container()
                    : Row(
                        children: [
                          height40,
                          Text(
                            '#ID1274637308',
                            style: normalBoldText,
                          ),
                          SizedBox(
                            width: width * .27,
                          ),
                          Text(
                            '₹1,253',
                            style: normalBoldText,
                          )
                        ],
                      ),
                Padding(
                  padding: EdgeInsets.only(top: id ? 10 : 0),
                  child: Text(
                    'Vattakarai, Chennavannanvilai,\nNagercoil, Tamil Nadu 629002, India',
                    style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        color: maincolor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
