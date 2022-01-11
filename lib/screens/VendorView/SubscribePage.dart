import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubscribePage extends StatefulWidget {
  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
  final form_key = GlobalKey<FormState>();
  var cvc;
  var card_number;
  var expiry_month;
  var expiry_year;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
          color: Colors.white,
          child: AdmobBanner(
            adUnitId: Provider.of<AdmobService>(context, listen: false)
                .getBannerAdUnitId(),
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
          )),

      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: form_key,
        child: SingleChildScrollView(
          child: Consumer2<Utils, WebServices>(
            builder: (context, utils_consumer, webservices_consumer, child) =>
                Stack(

              children: <Widget>[

                Container(
                    child: Image.asset('assets/images/sub2.jpg')
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
                //add the text here

                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20, top: 300),
                  child: Text('Subscription fee is \$4.99 billed monthly by Wingu Digtal LLC.  Subscription service can be cancelled at any time. ',
                  style: GoogleFonts.poppins(color: Colors.blue),),

                ),
                // card #
                Padding(
                  padding: EdgeInsets.only(top: 400,left: 20,right: 20),
                  child: Container(
                    // width: MediaQuery.of(context).size.width,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Card Number Required';
                        } else {
                          card_number = value;
                          return null;
                        }
                      },
                      decoration: InputDecoration(

                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: .5,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(4)),
                        labelText: 'Card Number',
                        hintText: '12345678910',
                        labelStyle: GoogleFonts.poppins(fontSize: 10),
                        prefixIcon: Icon(FontAwesomeIcons.ccVisa,color: Colors.black54,)

                        // Icon(
                        //   Icons.person,
                        //   color: Colors.blue,
                        // ),
                      ),
                    ),
                  ),
                ),
                // exp month
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20, top: 470),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: 100,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Expiration Month Required';
                                } else {
                                  expiry_month = value;
                                  return null;
                                }
                              },
                              decoration: InputDecoration(

                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: .5,
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                hintText: 'ex: 10',
                                hintStyle: GoogleFonts.poppins(fontSize: 10),
                                labelText: 'Exp. Month',
                                labelStyle: GoogleFonts.poppins(fontSize: 10),
                                prefixIcon: Icon(FontAwesomeIcons.creditCard),
                                // icon: Icon(
                                //   Icons.person,
                                //   color: Colors.white,
                                // ),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(4))
                              ),
                            ),
                          ),
                        ),
                        // exp yr
                        Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: SizedBox(
                            width: 100,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Year Expired Required';
                                } else {
                                  expiry_year = value;
                                  return null;
                                }
                              },
                              decoration: InputDecoration(

                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: .5,
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                labelText: 'Exp. Year',
                                hintText: 'ex: 2030',
                                hintStyle: GoogleFonts.poppins(fontSize: 10),
                                labelStyle: GoogleFonts.poppins(fontSize: 10),
                                // prefixIcon: Icon(
                                //   Icons.person,
                                //   color: Colors.blue,size: 12,
                                // ),
                                // border:
                                // OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(4))
                              ),
                            ),
                          ),
                        ),
                        // cvc
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: SizedBox(
                            width: 100,
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'CVC Required';
                                } else {
                                  cvc = value;
                                  return null;
                                }
                              },
                              decoration: InputDecoration(

                                isDense: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      width: .5,
                                      color: Colors.blue,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                labelText: 'CVC',
                                hintText: '345',
                                labelStyle: GoogleFonts.poppins(fontSize: 10),
                                  // border: OutlineInputBorder(
                                      // borderSide: BorderSide.none,
                                      // borderRadius: BorderRadius.circular(30))
                                // prefixIcon: Icon(
                                //   Icons.person,
                                //   color: Colors.blue,
                                // ),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.circular(4))
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // exp month
                // SizedBox(
                //   height: 40,
                // ),
                // button
                Align(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 590),
                      child: webservices_consumer.login_state == false
                          ? RaisedButton(
                              onPressed: () {
                                if (form_key.currentState.validate()) {
                                  webservices_consumer.Login_SetState();
                                  webservices_consumer.Vendor_Subscribe(
                                    context: context,
                                    card_number: card_number,
                                    expiry_month: expiry_month,
                                    expiry_year: expiry_year,
                                    cvc: cvc,
                                  );
                                }
                              },
                              color: Color(0xFF67b9fb),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                    // gradient: LinearGradient(
                                    //   colors: [
                                    //     Color(0xff67b9fb),
                                    //     Color(0xff8acbff)
                                    //   ],
                                    //   begin: Alignment.centerLeft,
                                    //   end: Alignment.centerRight,
                                    // ),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 200.0, minHeight: 50.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Subscribe",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                        // fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                            )
                          : CircularProgressIndicator()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
