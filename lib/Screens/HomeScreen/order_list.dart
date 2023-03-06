import 'package:flutter/material.dart';
import 'package:grocery_delivery_mobile_app/Constant/colors.dart';
import 'package:grocery_delivery_mobile_app/Constant/textstyle.dart';
import 'package:grocery_delivery_mobile_app/Screens/HomeScreen/widgets/custom_order_card.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order in Queue',
              style: mediumGreyText,
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomOrderDetailsCard(
                        index: index + 1,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 5,
                      );
                    },
                    itemCount: 5)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        onPressed: () {},
        child: const Icon(Icons.directions),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(90),
      child: AppBar(
        centerTitle: true,
        elevation: .1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 19,
                      backgroundColor: Colors.grey[400],
                      child: CircleAvatar(
                        radius: 17,
                        backgroundColor: whiteClr,
                        child: const CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                      ),
                    ),
                    ToggleSwitch(
                      minHeight: 25,
                      minWidth: 80,
                      borderColor: [Color.fromARGB(255, 231, 229, 229)],
                      inactiveBgColor: Color.fromARGB(255, 224, 224, 224),
                      radiusStyle: true,
                      cornerRadius: 40,
                      totalSwitches: 2,
                      activeBgColor: [blueColor],
                      labels: const ['Online', 'Offline'],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.wb_twilight),
                      color: redClr,
                    )
                  ],
                ),
              ),
              Container(
                height: 15,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color.fromARGB(255, 219, 218, 218),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
