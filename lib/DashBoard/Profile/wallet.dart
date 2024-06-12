import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  // Sample map with values to display
  Map<String, dynamic> transactionData = {
    'balance': 'QAR 14,235.34',
    'transactions': [
      {
        'name': 'Apartment',
        'date': 'Today 12:32',
        'amount': '-QAR 35.23',
      },
      {
        'name': 'Top up',
        'date': 'Yesterday 02:12',
        'amount': '+QAR 430.00',
      },
      {
        'name': 'Apartment',
        'date': 'Dec 24 13:53',
        'amount': '-QAR 13.00',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height * 0.043),
            Container(
              width: double.infinity,
              height: mQuery.size.height * 0.42,
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/profile_images/walletBg.png"),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: mQuery.size.height * 0.06),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                      ),
                      Expanded(child: SizedBox()),
                      ProfilePicture(
                        name: "",
                        radius: 24,
                        fontsize: 10,
                        img: 'https://s3-alpha-sig.figma.com/img/3ec5/ced7/e286f32007d6f797bb82ef693477efb4?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=IXbitsCzOW-CbxL~ob75feoR0qkvslNTxs~wxvMIUkdTEESVc5JWgVFwUDire8a~~m4ARUW1TDzLtrwy66Qik3dlmVuJKYgNlKsgVK1ReR5tIoB37HAm~RF83u-joD~psJAR7ENtN-GHtEPxZT3Mc33r6EaHuUevjNHHjzfMNHoFfgD66RFBnhv40yFUm~8Jz-t7StXuxG1kJhZTa-tCyURaWstOR~Wb9Q'
                            'dbfQ9-PI7x3-3ql9M~-bWVYnJEKXrG9rnE61CaVHtzlpwI6n2sPU7uPMXG-pnfXVxF3raVd~Rmjt8wnRR1gv~5kIh7dT0yz2FLk8jQKxZ77Lj5m-xI-Q__',
                      ),
                      SizedBox(width: mQuery.size.width * 0.016),
                      Text(
                        "Hello,\nAbdullah!",
                        style: TextStyle(color: Colors.black, fontFamily: 'SatoshiBold'),
                      )
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.016),
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height * 0.22,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(colors: [Color(0xffB5B5B5), Color(0xff797575)]),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: mQuery.size.height * 0.032),
                        Center(
                          child: Text(
                            "Main balance",
                            style: TextStyle(fontSize: 12, fontFamily: 'SatoshiBold', color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                              text: transactionData['balance'], // Use balance from the map
                              style: TextStyle(fontSize: 32, fontFamily: 'SatoshiBold', color: Colors.white),
                            ),
                          ])),
                        ),
                        Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: mQuery.size.width * 0.25,
                              height: mQuery.size.height * 0.052,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset("assets/images/profile_images/upload-line.svg"),
                                      Text(
                                        "Top up",
                                        style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'SatoshiMedium'),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.032),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: VerticalDivider(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: mQuery.size.width * 0.25,
                              height: mQuery.size.height * 0.052,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset("assets/images/profile_images/download-line.svg"),
                                      Text(
                                        "Withdraw",
                                        style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'SatoshiMedium'),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.032),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: VerticalDivider(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: mQuery.size.width * 0.25,
                              height: mQuery.size.height * 0.052,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SvgPicture.asset("assets/images/profile_images/exchange.svg"),
                                      Text(
                                        "Transfer",
                                        style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'SatoshiMedium'),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: mQuery.size.width * 0.032),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6),
                                    child: VerticalDivider(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.032)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Transactions",
                        style: TextStyle(color: Color(0xff191919), fontFamily: 'SatoshiBold'),
                      ),
                      Text(
                        "View all",
                        style: TextStyle(color: Color(0xff6B6B6B), fontSize: 12, fontFamily: 'SatoshiMedium'),
                      )
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.016),
                  // Iterating through transactions and creating UI elements
                  for (var transaction in transactionData['transactions'])
                    Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/profile_images/acLogo.svg"),
                            SizedBox(width: mQuery.size.width * 0.023),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  transaction['name'], // Use transaction name from the map
                                  style: TextStyle(fontSize: 13, color: Color(0xff191919), fontFamily: 'SatoshiBold'),
                                ),
                                Text(
                                  transaction['date'], // Use transaction date from the map
                                  style: TextStyle(color: Color(0xff78838D), fontSize: 12, fontFamily: 'SatoshiMedium'),
                                )
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Text(
                              transaction['amount'], // Use transaction amount from the map
                              style: TextStyle(color: transaction['amount'].startsWith('-') ? Color(0xffB83232) : Color(0xff289B4F), fontFamily: 'SatoshiMedium'),
                            ),
                            SizedBox(width: mQuery.size.width * 0.016),
                            Icon(
                              CupertinoIcons.right_chevron,
                              size: mQuery.size.height * 0.018,
                              color: Color(0xff535D66),
                            )
                          ],
                        ),
                        SizedBox(height: mQuery.size.height * 0.01),
                        Divider(color: Color(0xffEDEFF6)),
                      ],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
