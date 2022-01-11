import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/screens/Login_SignupView/SIGNUP.dart';
import 'package:foodtruck/screens/VendorView/MAp_vendor.dart';
import 'package:foodtruck/Services/admob.dart'; // admob_flutter
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  var email;
  var password;
  final form_key = GlobalKey<FormState>();
  final form_key1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
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
                            'Login as User',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.fastfood,
                            color: Colors.blue.shade400,
                          ),
                          child: Text(
                            'Login as Vendor',
                            style: TextStyle(
                              color: Colors.blue.shade400,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

 // admob_flutter                 
 //                  Container(
 //                      color: Colors.white,
 //                      child: AdmobBanner(
 //                        adUnitId:
 //                            Provider.of<AdmobService>(context, listen: false)
 //                                .getBannerAdUnitId(),
 //                        adSize: AdmobBannerSize.BANNER,
 //                        listener:
 //                            (AdmobAdEvent event, Map<String, dynamic> args) {},
 //                      ))
//

                ],
              ),
            )),
        backgroundColor: const Color(0xffffffff),
        body: TabBarView(
          children: [
            UserLogin(email, password, context, form_key1),
            VendorLogin(email, password, context, form_key)
          ],
        ),
      ),
    );
  }
}

Widget UserLogin(email, password, context, form_key) {
  return Form(
    key: form_key,
    child: SingleChildScrollView(
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/login_header.png',fit: BoxFit.cover,)),

          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
            ],
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
              widthFactor: 0.85,
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Password Required';
                  } else {
                    password = value;
                    return null;
                  }
                },

                /// t button style
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14.0,
                      color: Colors.blue),
                  suffixIcon: Icon(Icons.vpn_key),
                ),

                ///
              ),
            ),
          ),

          SizedBox(
            height: 15.0,
          ),
          Row(),
          Consumer<WebServices>(
            builder: (context, webservices_consumer, child) => Padding(
                padding: EdgeInsets.all(20),
                child: webservices_consumer.login_state == false
                    ? Align(
                  alignment: Alignment.center,
                      child: RaisedButton(
                          onPressed: () {
                            if (form_key.currentState.validate()) {
                              webservices_consumer.Login_SetState();
                              webservices_consumer.Login_UserApi(
                                      email: email,
                                      password: password,
                                      context: context)
                                  .then((value) {
                                var data =
                                    Provider.of<Utils>(context, listen: false);
                                data.storeData('video', 'video');
                                data.storeData('user', 'user');
                              });
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
                                  maxWidth: 120.0, minHeight: 40.0),
                              alignment: Alignment.center,
                              child: Text(
                                " User Login",
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
                    : CircularProgressIndicator()),
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
                    'Need an account?',
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
                        return SIGNUP();
                      }));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.person_add),
                        SizedBox(width: 5,),
                        Text(
                          'Sign up!',
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

// vendor login --------------------------||||

Widget VendorLogin(email, password, context, form_key) {
  return Form(
      key: form_key,
      child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                      Padding(
            padding: EdgeInsets.all(0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/vlogin_header.png',fit: BoxFit.cover,)),
          ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Username Required';
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

                  ///
                  ///
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 50, bottom: 20),
              child: FractionallySizedBox(
                widthFactor: 0.85,
                child: TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password Required';
                    } else {
                      password = value;
                      return null;
                    }
                  },

                  /// t button style
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.blue),
                    suffixIcon: Icon(Icons.vpn_key),
                  ),
                  ///
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Consumer<WebServices>(
              builder: (context, webservices_consumer, child) => Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    webservices_consumer.login_state == false
                        ? Align(
                      alignment: Alignment.center,

                          child: RaisedButton(
                              onPressed: () {
                                if (form_key.currentState.validate()) {
                                  webservices_consumer.Login_SetState();
                                  webservices_consumer.Login_VendorApi(
                                          email: email,
                                          password: password,
                                          context: context)
                                      .then((value) {
                                    var data = Provider.of<Utils>(context,
                                        listen: false);
                                    data.storeData('video', 'video');
                                    data.storeData('user', 'vendor');
                                  });
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
                                      maxWidth: 130.0, minHeight: 40.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Vendor Login",
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
                  ],
                ),
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
                      'Need an account?',
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
                          return SIGNUP();
                        }));
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(Icons.vpn_key),
                          SizedBox(width: 5,),
                          Text(
                            'Sign up!',
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
          ])));
}
