import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:usc_project/AUTH/login_page.dart';
import 'package:usc_project/AUTH/welcome_page.dart';
import 'package:usc_project/DashBoard/Home/home_page.dart';
import 'dart:io';

import 'package:usc_project/DashBoard/Profile/editProfile.dart';
import 'package:usc_project/DashBoard/Profile/notification.dart';
import 'package:usc_project/DashBoard/Profile/privacyPolicy.dart';
import 'package:usc_project/DashBoard/Profile/wallet.dart';

final authentication = GetStorage();

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isOn = true;
  File? _image;

  Map<String, String> userData = {
    'name': 'e1256',
    'email': 'example@example.com',
  };

  Future<void> getImage(ImageSource source) async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: mQuery.size.height*0.04,),
            Container(
              width: double.infinity,
              height: mQuery.size.height * 0.28,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: mQuery.size.height * 0.24,
                    padding: EdgeInsets.symmetric(
                        horizontal: mQuery.size.width * 0.045),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                isOn ?
                                'assets/images/profile_images/circularLightBg.png'
                                    : 'assets/images/profile_images/circularDarkBg.png'
                            ))),
                    child: Column(
                      children: [
                        SizedBox(height: mQuery.size.height * 0.035),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                  return Notifications();
                                }));
                              },
                              child: SvgPicture.asset("assets/images/profile_images/bellIcon.svg",
                                color: isOn ? Colors.black : Colors.white,),),
                            Expanded(child: SizedBox()),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return Wallet();
                                  }));
                                },
                                child: SvgPicture.asset("assets/images/profile_images/clockIcon.svg",
                                  color: isOn ? Colors.black : Colors.white,)),
                            SizedBox(width: mQuery.size.width * 0.04),
                            Icon(Icons.more_vert,color: isOn ? Colors.black : Colors.white,)
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      top: mQuery.size.height * 0.14,
                      left: mQuery.size.width * 0.32,
                      child: GestureDetector(
                        onTap: () {
                          _showImagePicker(context);
                        },
                        child: Stack(
                          children: [
                            ProfilePicture(
                              name: "",
                              radius: mQuery.size.height * 0.065,
                              fontsize: 10,
                              img: _image?.path ??
                                  "https://s3-alpha-sig.figma.com/img/e851/303c/2a03940b67487dc2fcebb1bd35f615e8?Expires=1716163200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LiaHCRLWFl-DC2m4ctOiPwIYAd1HgO4AVmLcXTqNg4UMxlcGVUFiLT3DN19cOierSvOr9tsaNggNsghG3UeaodVUg1gXp9C0b6OanIG~t0dxrDzoqUYrtNu8pwiypvtWrSQXOV3gbH~gMs0wGiT7lDu959qe9Zn59xTLVvPMNkRN~cNT8aw-"
                                      "STZ~MKhEaLldlfr2p5kPPhnAPRcCV92yJUEueiu-KTplRuqN4-qpxiEVNDBMx9W37CkbUVLQYlMZchqVtdEM0WlmeKOv-Nc1FuzBW~t4dn~NYVWtYFwedkln7vHkcxaN-j~4LkoXSjS2P~OxwenNzZE1uQEWo58AUQ__",
                            ),
                            Positioned(
                              top: mQuery.size.height * 0.09,
                              left: mQuery.size.width * 0.13,
                              child: SvgPicture.asset(
                                "assets/images/profile_images/circularEdit.svg",width: mQuery.size.width*0.12,),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: mQuery.size.height*0.01,),

            (authentication.read('Authentication')) == "Guest"
                ? Text("Welcome Guest",style: TextStyle(
                color: Colors.black,
                fontFamily: 'SatoshiBold'
            ),)
                : Column(
              children: [
                Center(
                  child: Text(
                    userData['name'] ?? "", // Name from userData map
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'SatoshiBold',
                        color: Colors.black),
                  ),
                ),
                Center(
                  child: Text(
                    userData['email'] ?? "", // Email from userData map
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'SatoshiMedium',
                        color: Colors.black),
                  ),
                ),
              ],
            ),




            SizedBox(height: mQuery.size.height * 0.023,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045,
                  vertical: mQuery.size.height*0.016),
              margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 0)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return EditProfile();
                      }));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/profile_images/profile-line.svg"),
                        SizedBox(width: mQuery.size.width * 0.032,),
                        Text("Edit profile information", style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.01,),
                  GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Notifications();
                      }));
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            "assets/images/profile_images/bellIcon.svg"),
                        SizedBox(width: mQuery.size.width * 0.032,),
                        Text("Notifications", style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'SatoshiMedium'
                        ),),
                        Expanded(child: SizedBox(),),
                        Text("ON", style: TextStyle(
                            color: Color(0xff1573FE),
                            fontSize: 16,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: mQuery.size.height * 0.01,),
                  Row(
                    children: [
                      SvgPicture.asset(
                          "assets/images/profile_images/walletIcon.svg"),
                      SizedBox(width: mQuery.size.width * 0.032,),
                      Text("Wallet", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: mQuery.size.height * 0.023,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: mQuery.size.height*0.016,
                  horizontal: mQuery.size.width * 0.045),
              margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 0)
                    )
                  ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          "assets/images/profile_images/referIcon.svg"),
                      SizedBox(width: mQuery.size.width * 0.032,),
                      Text("Refer & Earn", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),)
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.01,),
                  Row(
                    children: [
                      SvgPicture.asset(
                          "assets/images/profile_images/modeIcon.svg"),
                      SizedBox(width: mQuery.size.width * 0.032,),
                      Text("Mode", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                      Expanded(child: SizedBox(),),
                      Text(
                        isOn ? "Light" : "Dark", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),
                      ),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch(
                          thumbColor: MaterialStateProperty.all(
                              Colors.white
                          ),
                          trackOutlineColor: MaterialStatePropertyAll(
                              Colors.transparent
                          ),
                          inactiveTrackColor: Colors.black,
                          activeTrackColor: Color(0xffD9D9D9),
                          value: isOn,
                          onChanged: (value)
                          {
                            setState(() {
                              isOn = value;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: mQuery.size.height * 0.023,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: mQuery.size.height*0.016,
                  horizontal: mQuery.size.width * 0.045),
              margin: EdgeInsets.symmetric(
                  horizontal: mQuery.size.width * 0.045),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 0,
                        blurRadius: 7,
                        offset: Offset(0, 0)
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                          "assets/images/profile_images/profile-line.svg"),
                      SizedBox(width: mQuery.size.width * 0.032,),
                      Text("Help & Support", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),)
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.01,),
                  Row(
                    children: [
                      SvgPicture.asset(
                          isOn ?
                          "assets/images/profile_images/lockIcon.svg" : "assets/images/profile_images/contactUsIcon.svg"),
                      SizedBox(width: mQuery.size.width * 0.032,),
                      Text(isOn ? "Privacy policy" : "Contact us", style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                    ],
                  ),
                  SizedBox(height: mQuery.size.height * 0.01,),

                  authentication.read("Authentication") == "Guest"
                      ? GestureDetector(
                    onTap: ()
                    {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                        return LoginPage();
                      }),
                              (route) {
                            return false;
                          });
                    },
                    child: Text("Log In",style: TextStyle(
                        color:  Color(0xffFF2120),
                        fontFamily: 'SatoshiMedium'
                    ),),
                  )
                      :  GestureDetector(
                    onTap: ()
                    {
                      if(isOn)
                      {
                        logoutPop(context);
                      }
                      else
                      {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return PrivacyPolicy();
                        }));
                      }
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                            isOn ?
                            "assets/images/profile_images/loginIcon.svg" :  "assets/images/profile_images/lockIcon.svg"),
                        SizedBox(width: mQuery.size.width * 0.045,),
                        Text(
                          isOn ?
                          "Log Out" : "Privacy policy", style: TextStyle(
                            color: isOn ? Color(0xffFF2120) : Colors.black,
                            fontFamily: 'SatoshiMedium'
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void logoutPop(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
        return Center(
          child: AnimatedAlertDialog(),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }


}


class AnimatedAlertDialog extends StatefulWidget {
  @override
  _AnimatedAlertDialogState createState() => _AnimatedAlertDialogState();
}

class _AnimatedAlertDialogState extends State<AnimatedAlertDialog> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _scaleAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            height: mQuery.size.height * 0.55,
            width: mQuery.size.width * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/profile_images/logoutImage.svg",
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(height: 20),
                Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffCA3939),
                    fontFamily: 'SatoshiBold',
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.032),
                Center(
                  child: Text(
                    "Are you sure you want to log out?",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'SatoshiMedium',
                    ),
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.032),
                GestureDetector(
                  onTap: () {
                    _controller.reverse().then((_) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                            (route) => false,
                      );
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "YES, Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'SatoshiBold',
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: mQuery.size.height * 0.023),
                GestureDetector(
                  onTap: () {
                    _controller.reverse().then((_) {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Center(
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        color: Color(0xff9BA1A8),
                        fontFamily: 'SatoshiBold',
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

