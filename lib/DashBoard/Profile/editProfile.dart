import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

 // Import country_code_picker package

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  String selectedCountryCode = 'IN';
  String selectedCountry = "Select Country";
  String selectedGender = "Select Gender";


  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: mQuery.size.height * 0.06),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                ),
                SizedBox(width: mQuery.size.width * 0.045),
                Text(
                  "Edit Profile",
                  style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'SatoshiBold'),
                )
              ],
            ),
          ),
          SizedBox(height: mQuery.size.height * 0.023),
          Divider(color: Color(0xffDADADA)),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.045),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.09,
                            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                            decoration: BoxDecoration(
                                color: Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff9E9E9E))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: mQuery.size.height * 0.005),
                                Text(
                                  "Full name",
                                  style: TextStyle(fontSize: 11,
                                      fontFamily: 'SatoshiMedium',
                                      color: Color(0xff757575)),
                                ),
                                Container(
                                  height: mQuery.size.height * 0.05,
                                  child: TextField(
                                    controller: nameController,
                                    cursorColor: Colors.grey,
                                    style: TextStyle(fontFamily: 'SatoshiMedium'),
                                    decoration: InputDecoration(border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: mQuery.size.height * 0.023),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.09,
                            padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                            decoration: BoxDecoration(
                                color: Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff9E9E9E))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: mQuery.size.height * 0.005),
                                Text(
                                  "Email",
                                  style: TextStyle(fontSize: 11,
                                      fontFamily: 'SatoshiMedium',
                                      color: Color(0xff757575)),
                                ),
              
                                Container(
                                  height: mQuery.size.height * 0.05,
                                  child: TextField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    cursorColor: Colors.grey,
                                    style: TextStyle(fontFamily: 'SatoshiMedium'),
                                    decoration: InputDecoration(border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
              
                          SizedBox(height: mQuery.size.height * 0.023),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.09,
                            decoration: BoxDecoration(
                                color: Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff9E9E9E))),
                            child: Row( // Changed Column to Row
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CountryCodePicker(
                                  onChanged: (code) {
                                    setState(() {
                                      selectedCountryCode = code.dialCode!;
                                    });
                                  },
                                  initialSelection: 'IN',
                                  favorite: ['+91', 'IN'],
                                  showCountryOnly: false,
                                  showFlag: true,
                                  flagWidth: 18,
                                  textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Color(0xff757575)
                                  ),
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                                // Adjust the spacing as needed
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: mQuery.size.height * 0.005),
                                      Text(
                                        "Phone number",
                                        style: TextStyle(fontSize: 11,
                                            fontFamily: 'SatoshiMedium',
                                            color: Color(0xff757575)),
                                      ),
                                      Expanded(child: SizedBox()),
                                      Container(
                                        height: mQuery.size.height * 0.05,
                                        child: TextField(
                                          controller: phoneNoController,
                                          cursorColor: Colors.grey,
                                          style: TextStyle(fontFamily: 'SatoshiMedium'),
                                          maxLength: 10,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          decoration: InputDecoration(
                                              counter: SizedBox.shrink(),
                                              border: InputBorder.none),
              
                                        ),
              
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
              
                          SizedBox(height: mQuery.size.height * 0.023),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap : ()
                                {
                                  showCountryPicker(
                                    context: context,
                                    showPhoneCode: true, // optional. Shows phone code before the country name.
                                    onSelect: (Country country) {
                                      setState(() {
                                        selectedCountry = country.name;
                                      });
                                    },
                                  );
                                },
                                child: Container(
                                  width: mQuery.size.width*0.43,
                                  height: mQuery.size.height * 0.1,
                                  padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.02),
                                  decoration: BoxDecoration(
                                      color: Color(0xffF1F1F1),
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color: Color(0xff9E9E9E))
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: mQuery.size.height*0.01,),
                                          Text(
                                            "Country",
                                            style: TextStyle(fontSize: 11,
                                                fontFamily: 'SatoshiMedium',
                                                color: Color(0xff757575)),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Text(selectedCountry ,style: TextStyle(
                                              color: Color(0xff212121),
                                              fontSize: selectedCountry == "Select "
                                                  "Country" ? 13 : 11,
                                              fontFamily: 'SatoshiMedium'
                                          ),),
                                          SizedBox(height: mQuery.size.height*0.016,)
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: mQuery.size.height*0.023,),
                                          Icon(Icons.arrow_drop_down,
                                            color: Color(0xff9E9E9E),),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showGenderPicker(context);
                                },
                                child: Container(
                                  width: mQuery.size.width * 0.43,
                                  height: mQuery.size.height * 0.1,
                                  padding: EdgeInsets.symmetric(horizontal: mQuery.size.width * 0.03),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF1F1F1),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Color(0xff9E9E9E)),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: mQuery.size.height * 0.016),
                                          Text(
                                            "Gender",
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'SatoshiMedium',
                                              color: Color(0xff757575),
                                            ),
                                          ),
                                          Expanded(child: SizedBox()),
                                          Text(
                                            selectedGender,
                                            style: TextStyle(
                                              color: Color(0xff212121),
                                              fontSize: selectedGender == "Select Gender" ?  14 : 11,
                                              fontFamily: 'SatoshiMedium',
                                            ),
                                          ),
                                          SizedBox(height: mQuery.size.height * 0.01)
                                        ],
                                      ),
                                      Expanded(child: SizedBox()),
                                      Icon(Icons.arrow_drop_down,
                                        color: Color(0xff9E9E9E),),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
              
              
                          SizedBox(height: mQuery.size.height * 0.023),
                          Container(
                            width: double.infinity,
                            height: mQuery.size.height * 0.09,
                            padding: EdgeInsets.symmetric(
                                horizontal: mQuery.size.width*0.03
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffF1F1F1),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Color(0xff9E9E9E)
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: mQuery.size.height * 0.005),
                                Text(
                                  "Address",
                                  style: TextStyle(fontSize: 11,
                                      fontFamily: 'SatoshiMedium',
                                      color: Color(0xff757575)),
                                ),
                                Container(
                                  height: mQuery.size.height * 0.05,
                                  child: TextField(
                                    controller: addressController,
                                    cursorColor: Colors.grey,
                                    style: TextStyle(fontFamily: 'SatoshiMedium'),
                                    decoration: InputDecoration(border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: mQuery.size.height*0.2,),
                  Container(
                      width: double.infinity,
                      height: mQuery.size.height*0.07,
                      margin: EdgeInsets.symmetric(
                          horizontal: mQuery.size.width*0.045
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xffE9E9E9),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xff9E9E9E)
                          )
                      ),
                      child: Center(
                        child: Text("Submit",style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'SatoshiBold',
                            color: Color(0xff000000)
                        ),),
                      )
                  ),
                  SizedBox(height: mQuery.size.height*0.032,)
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }


  void _showGenderPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Gender",style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'SatoshiBold',
          ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Male',style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SatoshiMedium',
                  color: Colors.black
                ),),
                onTap: () {
                  setState(() {
                    selectedGender = 'Male';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Female',style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SatoshiMedium',
                    color: Colors.black
                ),),
                onTap: () {
                  setState(() {
                    selectedGender = 'Female';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Other',style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SatoshiMedium',
                    color: Colors.black
                ),),
                onTap: () {
                  setState(() {
                    selectedGender = 'Other';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}


