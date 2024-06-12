import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: kToolbarHeight,),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: mQuery.size.width*0.045
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap : (){
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg")
                    ),
                    SizedBox(width: mQuery.size.width*0.045,),
                    Text("Add To Cart",style: TextStyle(
                      fontFamily: 'SatoshiBold',
                      fontSize: 24
                    ),)
                  ],
                ),
                Column(
                  children: [

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
