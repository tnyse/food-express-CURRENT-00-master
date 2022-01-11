import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:admob_flutter/admob_flutter.dart'; // admob_flutter
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/Login_SignupView/login.dart';
import 'dart:ui' as ui;
import 'package:foodtruck/main.dart';
import 'package:foodtruck/Services/admob.dart';
// import 'package:google_sign_in/google_sign_in.dart';

import 'package:provider/provider.dart';



class SIGNUP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIGNUPSTATE();
  }
}

class SIGNUPSTATE extends State<SIGNUP> {


  var email;
  var password;

  final form_key = GlobalKey<FormState>();
  final form_key1 = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {



    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            child: Container(
              color: Colors.white,
              height: 55,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 55,
                    color: Colors.white,
                    child: TabBar(
                      tabs: <Widget>[
                        Tab(
                          icon: Icon(
                            Icons.person_pin,
                            color: Colors.blue.shade400,
                          ),
                          child: Text(
                            'Register as User',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.directions_car,

                            color: Colors.blue.shade400,
                          ),
                          child: Text(
                            'Register as Vendor',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

// admob_flutter
//                   Container(
//                       color: Colors.white,
//                       child: AdmobBanner(
//                         adUnitId:
//                             Provider.of<AdmobService>(context, listen: false)
//                                 .getBannerAdUnitId(),
//                         adSize: AdmobBannerSize.BANNER,
//                         listener:
//                             (AdmobAdEvent event, Map<String, dynamic> args) {},
//                       ))
//

                ],
              ),
            )),
        backgroundColor: const Color(0xffffffff),
        body: TabBarView(
          children: <Widget>[
            UserSignUp(email, password, context, form_key),
            VendorSignUp(email, password, context, form_key1)
          ],
        ),
      ),
    );
  }
}

///  user registration

Widget UserSignUp(email, password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                                  Padding(
            padding: EdgeInsets.all(0),
            child: Container(
              width: MediaQuery.of(context).size.width,

                child: Image.asset('assets/images/login_header.png',fit: BoxFit.fitWidth,)),
          ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Required';
                    } else {
                      email = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.blue),
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password Required';
                    } else if (value.length < 8) {
                      return 'It must contain at least 8 characters.';
                    } else {
                      password = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Create a Password',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.blue),
                    suffixIcon: Icon(Icons.vpn_key),
                  ),
                ),
              ),
            ),
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(

                // padding: EdgeInsetsDirectional.fromSTEB(190, 12, 30, 0),
                padding: EdgeInsets.all(20), // tablet centers the button
                child: webservice_consumer.login_state == false
                    ? Align(
                  alignment: Alignment.center,
                      child: RaisedButton(
                          onPressed: () {
                            if (form_key.currentState.validate()) {

                              webservice_consumer.Login_SetState();
                              webservice_consumer.Signup_UserApi(
                                password: password,
                                //password,
                                email: email,
                                //email,
                                context: context,
                              )
                                  .then((value) => webservice_consumer
                                  .send_user_location(context));
                            }
                          },
                          color: Color(0xFF67b9fb),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 150.0, minHeight: 40.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign me up!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // fontFamily: 'Poppins',
                                  // fontSize: 18,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                    )
                    : CircularProgressIndicator(),
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 11,
                        color: Colors.blue,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.vpn_key),
                          SizedBox(width: 5,),
                          Text(
                            'Log in!',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
      ),
    ),
  );
}

///vendor registration

Widget VendorSignUp(email, password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                                              Padding(
            padding: EdgeInsets.all(0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/vsu_header.png',fit: BoxFit.cover,)),
          ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: .85,

                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email Required';
                    } else {
                      email = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.blue),
                    suffixIcon: Icon(Icons.email),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                // width: 300,
                widthFactor: .85,
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password Required';
                    } else if (value.length < 8) {
                      return 'It must contain at least 8 characters.';
                    } else {
                      password = value;
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Create a Password',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.blue),
                    suffixIcon: Icon(Icons.vpn_key),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 15.0,
            ),
            Consumer<WebServices>(
              builder: (context, webservice_consumer, child) => Padding(
                // padding: EdgeInsetsDirectional.fromSTEB(180, 12, 30, 0),
                padding: EdgeInsets.all(20),
                child: webservice_consumer.login_state == false
                    ? Align(
                  alignment: Alignment.center,
                      child: RaisedButton(
                          onPressed: () {
                            if (form_key.currentState.validate()) {
                              webservice_consumer.Login_SetState();
                              webservice_consumer.Signup_VendorApi(
                                password: password,
                                email: email,
                                context: context,
                              ).then((value) => webservice_consumer
                                      .send_vendor_location(context));
                            }
                          },
                          color: Color(0xFF67b9fb),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                                borderRadius: BorderRadius.circular(30)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 180.0, minHeight: 40.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Register My Truck",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                    )
                    : CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width / 10, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 11,
                        color: Colors.blue,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Login();
                        }));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.vpn_key),
                          SizedBox(width: 5,),
                          Text(
                            'Log in!',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
      ),
    ),
  );
}
