import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_delivery_mobile_app/Constant/colors.dart';
import 'package:grocery_delivery_mobile_app/Constant/height_width.dart';
import 'package:grocery_delivery_mobile_app/Constant/textstyle.dart';
import 'package:grocery_delivery_mobile_app/Screens/HomeScreen/widgets/custom_order_card.dart';
import 'package:slider_button/slider_button.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(9.6982124, 76.7583488), zoom: 10, bearing: 0.1);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: appBar(context),
      body: Container(
        height: height * .55,
        child: GoogleMap(
          initialCameraPosition: initialCameraPosition,
          zoomControlsEnabled: false,
          mapType: MapType.normal,
          markers: _markers,
          polylines: <Polyline>{
            const Polyline(
              polylineId: PolylineId("polyline_1"),
              points: [
                LatLng(9.6982124, 76.7583488),
                LatLng(9.67036, 76.560875),
                LatLng(9.76768, 76.70745),
                LatLng(9.686181, 76.905229)
              ],
              color: Colors.blue,
              width: 5,
            ),
          },
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: whiteClr),
        height: height * .6,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Divider(
                thickness: 5,
                endIndent: width * .45,
                indent: width * .45,
                color: maincolor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.blue,
                        size: 20,
                      ),
                      Text('  DELIVERY LOCATION'),
                    ],
                  ),
                  Row(
                    children: [Text('#ODNO0000598')],
                  )
                ],
              ),
              CustomOrderDetailsCard(
                index: 1,
                id: true,
              ),
              Divider(),
              ListTile(
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Payment',style: normalText,),
                    Text('₹ 250',style: TextStyle(fontSize: 15, height: 2, fontWeight: FontWeight.bold),),
                  ],
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Payment Mode',style: normalText,),
                    Text('Cash on Delivery',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: blackclr,height: 2),)
                  ],
                ),
                // subtitle: ,
              ),
              Divider(),
              Text('   Delivering to', style: normalText,),
              ListTile(
                leading:
                
                const CircleAvatar(radius: 15,backgroundImage: AssetImage('assets/images/profile.jpg'),),
               title: Text('Anita',),
               trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: 16, child: Icon(Icons.message,size: 17,),),
                  SizedBox(width: 10,),
                  CircleAvatar(radius: 16, child: Icon(Icons.call, size: 17,),)
               ],),
              ),
              height10,
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: SliderButton(action: (){},
                      buttonColor: whiteClr,
                      shimmer: false,
                      radius: 10,
                      height: 60,
                      alignLabel: Alignment(0.2, 0),
                      backgroundColor: blueColor,
                      label: Text('Order Completed',style: TextStyle(color: whiteClr),),
                      icon: Icon(Icons.keyboard_double_arrow_right),
                      ),
                    ),
                  ),
                ],
              ),
              Container(height: 50,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  CircleAvatar(child: Icon(Icons.warning),),
                  Text('Report Issues about this order',style: TextStyle(color: blueColor,fontWeight: FontWeight.w500),),
                  Row(
                    children: [
                      Container(child: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_outlined, color: blueColor,)),),
                    ],
                  ),
                  ],),),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: () {
           Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.red,
        ),
      ),
      title: Text(
        '17 mins',
        style: mediumBlackText,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: Row(
            children: [
              Text(
                '1.8 km',
                style: mediumGreyText,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 2,
                  backgroundColor: Color.fromARGB(255, 192, 221, 245),
                ),
              ),
              Text(
                '11:48 am',
                style: mediumGreyText,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

final _markers = <Marker>{
  const Marker(
    markerId: MarkerId("marker1"),
    position: LatLng(9.6982124, 76.7583488),
    infoWindow: InfoWindow(
      title: "Grocery Store-1",
    ),
    icon: BitmapDescriptor.defaultMarker,
  ),
  const Marker(
      markerId: MarkerId("marker2"),
      position: LatLng(9.67036, 76.560875),
      infoWindow: InfoWindow(
        title: "Grocery Store-2",
      )),
  const Marker(
      markerId: MarkerId("marker3"),
      position: LatLng(9.686181, 76.905229),
      infoWindow: InfoWindow(
        title: "Grocery Store-3",
      ))
};

bottmSheet(context, double width, double height) {
  return showBottomSheet(
      context: (context),
      builder: (context) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteClr),
            height: height * .5,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Divider(
                    thickness: 5,
                    endIndent: width * .45,
                    indent: width * .45,
                    color: maincolor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 20,
                          ),
                          Text('  DELIVERY LOCATION'),
                        ],
                      ),
                      Row(
                        children: [Text('#ODNO0000598')],
                      )
                    ],
                  )
                ],
              ),
            ),
          ));
}
