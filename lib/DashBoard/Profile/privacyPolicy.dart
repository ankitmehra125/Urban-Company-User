import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    var mQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mQuery.size.width*0.045
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mQuery.size.height*0.043,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset("assets/images/dashboard_images/home_images/circleBack.svg"),
                ),
                SizedBox(width: mQuery.size.width*0.046,),
                Text("Privacy Policy",style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'SatoshiBold'
                ),)
              ],
            ),
            Divider(color: Color(0xffDADADA),),
            SizedBox(height: mQuery.size.height*0.023,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('1. Types data we collect',style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.005,),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("2. Use of your personal data",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.005,),
                    Text("Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae."
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit."
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),

                    SizedBox(height: mQuery.size.height*0.023,),
                    Text("3. Disclosure of your personal data",style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'SatoshiBold'
                    ),),
                    SizedBox(height: mQuery.size.height*0.005,),
                    Text("At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum "
                        "deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. "
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. "
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),
                    SizedBox(height: mQuery.size.height*0.01,),
                    Text("Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus"
                      ,style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SatoshiMedium'
                      ),),

                    SizedBox(height: mQuery.size.height*0.032)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
