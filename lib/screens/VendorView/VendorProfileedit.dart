import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:admob_flutter/admob_flutter.dart'; // admob_flutter
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart';

class VENDORprofileEdith extends StatefulWidget {
  var snapshot_profile_data;

  VENDORprofileEdith({
    this.snapshot_profile_data,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORprofileEdithstate();
  }
}

class VENDORprofileEdithstate extends State<VENDORprofileEdith> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var utils_consumer = Provider.of<Utils>(context, listen: false);
    utils_consumer.selected_menu_image1 = null;
  }
  var phone;
  var business_name;
  var unique_detail;
  var detail;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

// admob_flutter
      bottomNavigationBar: Container(
          color: Colors.white,
          child: AdmobBanner(
            adUnitId: Provider.of<AdmobService>(context, listen: false)
                .getBannerAdUnitId(),
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
          )),
//

      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
          child: Consumer2<WebServices, Utils>(
              builder: (context, webservices_consumer, utils_consumer, child) =>
                  Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Stack(
//                  alignment: Alignment.center,
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
                            // back button
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      top:
                                          MediaQuery.of(context).size.width / 8,
                                      left: MediaQuery.of(context).size.width /
                                          20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.blue[900].withOpacity(.5),
                                        shape: BoxShape.circle),
                                    width: 30,
                                    height: 30,
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                            ),
                            // header text
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    top: 90.0, left: 8, right: 8),
                                child: Text(
                                  'EDIT PROFILE',
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 14,
                                    color: const Color(0xffffffff),
                                    height: 1.7142857142857142,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 60.0),
                                child: SizedBox(
                                  height: 45.0,
                                  child: Text(
                                    'FOODTRUCK.EXPRESS',
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.bold,
                                      // fontFamily: 'Arial',
                                      fontSize: 20,
                                      color: const Color(0xffffffff),
                                      height: 1,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Divider(),
                        SizedBox(
                          height: 20,
                        ),
                        // image row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // image preview container
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: utils_consumer.selected_menu_image1 == null
                                  ? Center(
                                      child: Text('No Image Selected'),
                                    )
                                  : Image.file(
                                      File(utils_consumer
                                          .selected_menu_image1.path
                                          .toString()),
                                      fit: BoxFit.fill,
                                      width: 120,
                                      height: 100,
                                    ),
                            ),
                            // select image
                            Padding(
                              padding: const EdgeInsets.all(1),
                              child: Container(
                                // width: MediaQuery.of(context).size.width,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      utils_consumer.selectimage1();
                                    },
                                    child: Text(
                                      '+Select \n Profile \n Picture',
                                      style: TextStyle(
                                          color: Color(0xFF67b9fb),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            //update image button
                            // Divider(),
                            webservices_consumer.login_state == false
                                ? RaisedButton(
                                    onPressed: () {
                                      setstate() {
                                        setState(() {});
                                      }

                                      try {
                                        webservices_consumer.Login_SetState();
                                        webservices_consumer.Update_Profile_Pic(
                                          pro_pic: utils_consumer
                                              .selected_menu_image1.path,
                                          context: context,
                                          id: widget.snapshot_profile_data.id,
                                        ).then((value) {
                                          Future.delayed(
                                              Duration(seconds: 2), setstate);
                                        });
                                      } catch (e) {
                                        webservices_consumer.Login_SetState();
                                        showDialog(
                                            builder: (context) => AlertDialog(
                                                  title: Center(
                                                    child: Text(
                                                        'There was a Problem Encountered',
                                                        style: TextStyle(
                                                            color:
                                                                Colors.blue)),
                                                  ),
                                                  content: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 20),
                                                      child: Text(
                                                          'An Image is Required')),
                                                ),
                                            context: context);
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: EdgeInsets.all(0.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Container(
                                        constraints: BoxConstraints(
                                            maxWidth: 100.0, minHeight: 50.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Update \nImage",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ],
                        ),
                        // Divider(),
                        SizedBox(
                          height: 40,
                        ),

                        // truck name input

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: 480,
                            child: TextFormField(
                              initialValue:
                                  widget.snapshot_profile_data.business_name,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required field';
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
                                  labelText: 'Truck Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold),
                                  prefixIcon: Icon(
                                    Icons.food_bank,
                                    color: Colors.blue,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(30))),
                            ),
                          ),
                        ),

                        // phone input

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: 480,
                            child: TextFormField(
                              initialValue: widget.snapshot_profile_data.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Phone is Required';
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

// truck detail input

                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: 480,
                            child: TextFormField(
                              initialValue:
                                  widget.snapshot_profile_data.unique_detail,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required field';
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
                                  labelText: 'Unique Truck Details',
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
                        // slogan
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SizedBox(
                            width: 480,
                            child: TextFormField(
                              initialValue: widget.snapshot_profile_data.detail,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Required field';
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
                                  labelText: 'Slogan / Tagline',
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
                        Divider(),

                        // update button

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            webservices_consumer.login_state_third == false
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      20,
                                      10,
                                      20,
                                      0,
                                    ),
                                    child: RaisedButton(
                                      onPressed: () {
                                        setstate() {
                                          setState(() {});
                                        }

                                        try {
                                          if (_formkey.currentState.validate())
                                            webservices_consumer
                                                .Login_SetState_third();
                                          webservices_consumer
                                              .Update_Profile_Details(
                                            phone: phone,
                                            business_name: business_name,
                                            unique_detail: unique_detail,
                                            detail: detail,
                                            context: context,
                                            id: widget.snapshot_profile_data.id,
                                          ).then((value) {
                                            Future.delayed(
                                                Duration(seconds: 3), setstate);
                                          });
                                        } catch (e) {
                                          webservices_consumer
                                              .Login_SetState_third();
                                          showDialog(
                                              builder: (context) => AlertDialog(
                                                    title: Center(
                                                      child: Text(
                                                          'There was a Problem Encountered',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.blue)),
                                                    ),
                                                    content: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 20),
                                                        child: Text(
                                                            'All Images and Fields Are Required')),
                                                  ),
                                              context: context);
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 180.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Update Menu Details",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ],
                        ),

                        ///
                      ],
                    ),
                  ))),
    );
  }
}
