import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart'; // admob_flutter
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class vendoreditmenu extends StatefulWidget {
  var snapshot_data;
  var snapshot_profile_data;

  vendoreditmenu({
    this.snapshot_data,
    this.snapshot_profile_data,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vendoreditmenustate();
  }
}

class vendoreditmenustate extends State<vendoreditmenu> {
  final _formkey = GlobalKey<FormState>();
  var menu_description;
  var menu_title;
  var menu_price;

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
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Consumer2<WebServices, Utils>(
            builder: (context, webservices_consumer, utils_consumer, child) {
          return Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Stack(
//                  alignment: Alignment.center,
                  children: <Widget>[
                    // Adobe XD layer: 'background' (shape)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: Image.asset(
                        'assets/images/bg.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.width / 8,
                              left: MediaQuery.of(context).size.width / 20),
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
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Padding(
                        padding: EdgeInsets.only(top: 90.0, left: 8, right: 8),
                        child: Text(
                          'EDIT ITEM',
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: Text(
                        'Change Product Image',
                        style: GoogleFonts.poppins(color: Colors.black45, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 100,
                      child: utils_consumer.selected_menu_image1 == null
                          ? Padding(
                            padding: const EdgeInsets.only(left: 20,),
                            child: Center(
                                child: Text('No Image Selected'),
                              ),
                          )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.file(
                                  File(utils_consumer.selected_menu_image1.path
                                      .toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Container(

                        child: RaisedButton(
                          onPressed: () {
                            utils_consumer.selectimage1();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.all(0),
                          child: Ink(
                            
                            child: Row(
                              children: [
                                Icon(Icons.add),
                                Container(
                                  // constraints: BoxConstraints(
                                  //     maxWidth: 60.0, minHeight: 50.0),
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Select\nNew Image",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.black45, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                      ),
                    ),
webservices_consumer.login_state_second == false
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RaisedButton(
                          onPressed: () {
                            setstate() {
                              setState(() {});
                            }

                            try {
                              webservices_consumer.Login_SetState_Second();
                              webservices_consumer.Update_Menu_Images(
                                image1:
                                    utils_consumer.selected_menu_image1.path,
                                context: context,
                                id: widget.snapshot_data.id,
                              ).then((value) {
                                Future.delayed(Duration(seconds: 2), setstate);
                              });
                            } catch (e) {
                              webservices_consumer.Login_SetState();
                              showDialog(
                                  builder: (context) => AlertDialog(
                                        title: Center(
                                          child: Text(
                                              'There was a Problem Encountered',
                                              style: TextStyle(
                                                  color: Colors.blue)),
                                        ),
                                        content: Text(
                                            'All Images and Fields Are Required'),
                                      ),
                                  context: context);
                            }
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          padding: EdgeInsets.all(.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff67b9fb),
                                    Color(0xff8acbff)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(4)),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 120.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Update \n Menu Image",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(),
                      ),

                  ],
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      initialValue: widget.snapshot_data.menu_title,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu title is Required';
                        } else {
                          menu_title = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          filled: true,
                          isDense: true,
                          fillColor: Colors.blueGrey[50],
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: .5,
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          labelText: 'Menu Title',
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
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      initialValue: widget.snapshot_data.menu_description,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu Description is Required';
                        } else {
                          menu_description = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          filled: true,
                          isDense: true,
                          fillColor: Colors.blueGrey[50],
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: .5,
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          labelText: 'Menu Description',
                          labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.format_align_left_outlined,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      initialValue: widget.snapshot_data.menu_price.toString(),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Menu Price is Required';
                        } else {
                          menu_price = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          filled: true,
                          isDense: true,
                          fillColor: Colors.blueGrey[50],
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: .5,
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          labelText: 'Menu Price',
                          labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                          prefixIcon: Icon(
                            Icons.price_change,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                Divider(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    webservices_consumer.login_state == false
                        ? Padding(
                          padding: const EdgeInsets.fromLTRB(0,20,20,0,),
                          child: RaisedButton(
                              onPressed: () {
                                setstate() {
                                  setState(() {});
                                }

                                if (_formkey.currentState.validate())
                                  webservices_consumer.Login_SetState();
                                webservices_consumer.Update_Menu_Details(
                                  menu_description: menu_description,
                                  menu_price: menu_price,
                                  menu_title: menu_title,
                                  context: context,
                                  id: widget.snapshot_data.id,
                                ).then((value) {
                                  Future.delayed(Duration(seconds: 2), setstate);
                                });
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 200.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Update Menu Details",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                        )
                        : CircularProgressIndicator(),

                  ],

                ),
                SizedBox(height: 40,),

                // Divider(),
                
              ],
            ),
          );
        })));
  }
}
