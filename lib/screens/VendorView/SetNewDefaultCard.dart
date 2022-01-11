import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/screens/VendorView/VENDORprofile.dart';
import 'package:foodtruck/Services/admob.dart'; // admob_flutter
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class vendoraddcard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return vendoraddmenustate();
  }
}

class vendoraddmenustate extends State<vendoraddcard> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formkey = GlobalKey<FormState>();
  var exp_month;
  var card_number;
  var exp_year;
  var cvc;

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

        key: scaffoldKey,
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(child: Consumer2<WebServices, Utils>(
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
                                color: Colors.blue[800].withOpacity(.5),
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
                          'PAYMENT METHOD',
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
SizedBox(height: 40,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    
    Text('Pay with credit card'),
    Image.asset('assets/images/cards.png',fit: BoxFit.fill,height: 40,),
  ],
),
SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Card Number Required';
                        } else {
                          card_number = value;
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
                          labelText: 'Card Number',
                          hintText: 'e.g 12345678910',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          prefixIcon: Icon(
                            Icons.credit_card,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'expiring month is Required';
                        } else {
                          exp_month = value;
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
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Expiring Month',
                          hintText: 'e.g 3',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'expiring year is Required';
                        } else {
                          exp_year = value;
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
                              borderRadius: BorderRadius.circular(8)),
                          labelText: 'Expiring Year',
                          hintText: 'e.g 2021',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          prefixIcon: Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 480,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'cvc is Required';
                        } else {
                          cvc = value;
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
                          labelText: 'CVC',
                          hintText: 'e.g 000',
                          labelStyle: TextStyle(
                            color: Colors.black87,
                          ),
                          prefixIcon: Icon(
                            FontAwesomeIcons.creditCard,
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
                            padding: const EdgeInsets.fromLTRB(0, 10, 12, 0),
                            child: RaisedButton(
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  webservices_consumer.Login_SetState();
                                  webservices_consumer.Set_Default_Payment_Card(
                                    card_number: card_number,
                                    exp_year: exp_year,
                                    exp_month: exp_month,
                                    context: context,
                                    cvc: cvc,
                                  ).then((value) => showDialog(
                                      builder: (context) => AlertDialog(
                                            title: Center(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(value,
                                                      style:
                                                          TextStyle(fontSize: 14)),
                                                  InkWell(
                                                      onTap: () {
                                                        Navigator.of(context).pushAndRemoveUntil(
                                                            MaterialPageRoute(builder: (context) =>
                                                                VENDORprofile()), (Route<dynamic> route) => false);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.all(
                                                                8.0),
                                                        child: Text('GO TO PROFILE',
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .lightBlueAccent)),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                      context: context));
                                }
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
                                    "Set Card As Default",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              color: Color(0xFF67b9fb),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ),
              ],
            ),
          );
        })));
  }
}
