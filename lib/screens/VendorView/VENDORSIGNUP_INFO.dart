import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/screens/UserView/Map_user.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class VENDORSIGNUP22 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: VENDORSIGNUP2(),
    );
  }
}

class VENDORSIGNUP2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORSIGNUP2STATE();
  }
}

class VENDORSIGNUP2STATE extends State<VENDORSIGNUP2> {
  var business_name;
  var unique_detail;
  var phone;
  var detail;
  var pro_pic;
  final form_key = GlobalKey<FormState>();
  final VoidCallback continueButton;

  VENDORSIGNUP2STATE({
    Key key,
    this.continueButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
                    color: Colors.white,
                    child: AdmobBanner(
                      adUnitId: Provider.of<AdmobService>(context, listen: false).getBannerAdUnitId(),
                      adSize: AdmobBannerSize.BANNER,
                      listener: (AdmobAdEvent event, Map<String, dynamic> args){

                      },
                    )
                  ),
      appBar: AppBar(
        actions: <Widget>[
         Image.asset('assets/images/logo.png', width: 100,),
         SizedBox(width: 8,)
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'VENDOR ONBOARDING',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 15,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.visible,
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Consumer2<Utils, WebServices>(
              builder: (context, utils_consumer, webservices_consumer, child) =>
                  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  // header
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150.0,
                    child: Image.asset(
                      'assets/images/profile_header.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(

                      decoration: BoxDecoration(color: Colors.blue,),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child:

                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 10),
                            child: Text('FOODTRUCK DETAIL ENTRY:',style: GoogleFonts.nunitoSans(fontSize: 16,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          )


                      )),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Business Name Required';
                          } else {
                            business_name = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, right: 20),
                            filled: true,
                            isDense: true,
                            fillColor: Colors.blueGrey[50],
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .5,
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            labelText: 'Business Name',
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.food_bank,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Unique Detail Required';
                          } else {
                            unique_detail = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, right: 20),
                            filled: true,
                            isDense: true,
                            fillColor: Colors.blueGrey[50],
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .5,
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            labelText: 'What\'s your specialty?',
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.list,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Details Required';
                          } else {
                            detail = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, right: 20),
                            filled: true,
                            isDense: true,
                            fillColor: Colors.blueGrey[50],
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .5,
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            labelText: 'Slogan',
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.comment,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.all(10),
                    child: SizedBox(
                      width: 480,
                      child: TextFormField(
                        keyboardType:TextInputType.phone ,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Phone Required';
                          } else {
                            phone = value;
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                            contentPadding:
                            EdgeInsets.only(left: 20, right: 20),
                            filled: true,
                            isDense: true,
                            fillColor: Colors.blueGrey[50],
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: .5,
                                  color: Colors.blue,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            labelText: 'Phone',
                            labelStyle: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      
                      child: RaisedButton(
                        onPressed: () {
                          return utils_consumer.selectimage();
                        },
                      
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [Color(0xff67b9fb), Color(0xff8acbff)],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
        color: Colors.blue,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Truck/Logo Image",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
                      ),
                    ),
                  ),
                  Container(
                    width: 170,
                    height: 170,
                    child: utils_consumer.selected_image == null
                        ? Center(child: Text('No Image Selected'))
                        : Image.file(File(utils_consumer.selected_image.path)),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: webservices_consumer.login_state == false
                        ?RaisedButton(
                      onPressed: () {
                if (form_key.currentState.validate()) {
                  try{
                  webservices_consumer.Login_SetState();
                        webservices_consumer.Vendor_InfoApi(
                          context:context,
                          business_name: business_name,
                          unique_detail: unique_detail,
                          detail:detail,
                          phone:phone,
                          path: utils_consumer.selected_image.path,
                        );}
                        catch(e){
                           webservices_consumer.Login_SetState();
                          showDialog(
                              builder:(context)=> AlertDialog(
            title: Center(
              child:
                  Text('There was a Problem Encountered', style: TextStyle(color: Colors.blue)),
            ),
            content: Text('All Images and Fields Are Required'),
          ),
          context: context);
                        }
                      }},

                    color: Color(0xFF67b9fb),
                     
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    padding: EdgeInsets.all(0.0),
    child: Ink(
      decoration: BoxDecoration(
          // gradient: LinearGradient(colors: [Color(0xff67b9fb), Color(0xff8acbff)],
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          // ),
        color: Colors.blue,
          borderRadius: BorderRadius.circular(4)
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
        alignment: Alignment.center,
        child: Text(
          "Continue",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white
          ),
        ),
      ),
    ),
        ):CircularProgressIndicator()
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[],
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
