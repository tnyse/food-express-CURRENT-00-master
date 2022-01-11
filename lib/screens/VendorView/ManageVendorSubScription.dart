import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart'; // admob_flutter
import 'package:foodtruck/screens/VendorView/SubscribePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';

class managesubscription extends StatefulWidget {
  var id;
  managesubscription(this.id);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return managesubscriptionstate();
  }
}

class managesubscriptionstate extends State<managesubscription> {
  final _formkey = GlobalKey<FormState>();
  var menu_description;
  var menu_title;
  var menu_price;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

// admob banner
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
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        'assets/images/sub.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
// back button
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
                                color: Colors.blue[900].withOpacity(0.5),
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
// sub heading txt
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Padding(
                        padding: EdgeInsets.only(top: 80.0, left: 8, right: 8),
                        child: Text(
                          'Manage Subscription',
                          style: GoogleFonts.poppins(fontSize: 14,color: Colors.white,height: 2),

                          textAlign: TextAlign.center,
                        ),
                      )),
                    ),
// heading txt
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: SizedBox(
                          height: 45.0,
                          child: Text(
                            'MEMBERSHIP',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin:
                          const EdgeInsets.only(top: 400, left: 20, right: 20),
                      child: Column(
                        children: [
                          Divider(),
                          Text(
                            'Your FoodTruck.Express subscription enables you to see users on the map as they see you, giving you the opportunity to relocate to a better location with more users.', style: GoogleFonts.poppins(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
// subscription activity
                    FutureBuilder(
                        future:
                            webservices_consumer.get_vender_subscription_id(),
                        builder: (context, subscription_id_snapshot) {
                          return subscription_id_snapshot.hasData
                              ? FutureBuilder(
                                  future: webservices_consumer
                                      .get_vender_subscription_status(
                                          subscription_id_snapshot
                                              .data['subscription_id']),
                                  builder:
                                      (context, subscription_status_snapshot) {
                                    return subscription_status_snapshot.hasData
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(top: 520),
                                            child: Card(
                                              elevation: 0,
                                              child: Column(
                                                children: <Widget>[
                                                  Builder(builder: (context) {
                                                    if (subscription_status_snapshot
                                                                .data ==
                                                            'active' ||
                                                        subscription_status_snapshot
                                                                .data ==
                                                            'trialing') {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 20, top: 10),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                                'Your Subscription is ${subscription_status_snapshot.data}' +
                                                                    '!',style: GoogleFonts.poppins(color: Colors.green),),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          15.0),
                                                              child: Text(
                                                                'Cancel Subscription',
                                                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold)
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: webservices_consumer
                                                                          .login_state ==
                                                                      false
                                                                  ? RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        webservices_consumer
                                                                            .Login_SetState();
                                                                        webservices_consumer
                                                                            .cancel_subscription()
                                                                            .then((value) {
                                                                          Fluttertoast.showToast(
                                                                              msg: value.toString(),
                                                                              gravity: ToastGravity.CENTER,
                                                                              fontSize: 16.0);
                                                                        });
                                                                      },
                                                                      color: Colors
                                                                          .blue,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(4)),
                                                                      padding: EdgeInsets
                                                                          .fromLTRB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            // gradient: LinearGradient(
                                                                            //   colors: [
                                                                            //     Color(0xff67b9fb),
                                                                            //     Color(0xff8acbff)
                                                                            //   ],
                                                                            //   begin: Alignment.centerLeft,
                                                                            //   end: Alignment.centerRight,
                                                                            // ),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        child:
                                                                            Container(
                                                                          constraints: BoxConstraints(
                                                                              maxWidth: 120.0,
                                                                              minHeight: 40.0),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Text(
                                                                            "Cancel",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                GoogleFonts.poppins(fontSize: 16,color: Colors.white)
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : CircularProgressIndicator(),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    } else if (subscription_status_snapshot
                                                                .data ==
                                                            'canceled' ||
                                                        subscription_status_snapshot
                                                                .data ==
                                                            'pending' ||
                                                        subscription_status_snapshot
                                                                .data ==
                                                            'incomplete') {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                                'Your Subscription is ${subscription_status_snapshot.data}'),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top:
                                                                          15.0),
                                                              child: Text(
                                                                'Renew Subscription',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: webservices_consumer
                                                                          .login_state ==
                                                                      false
                                                                  ? RaisedButton(
                                                                      onPressed:
                                                                          () {
                                                                        webservices_consumer
                                                                            .Login_SetState();
                                                                        webservices_consumer
                                                                            .reactivate_subscription(widget.id)
                                                                            .then((value) {
                                                                          Fluttertoast.showToast(
                                                                              msg: value.toString(),
                                                                              gravity: ToastGravity.CENTER,
                                                                              fontSize: 16.0);
                                                                          //Text(value);
                                                                        });
                                                                      },
                                                                      color: Colors
                                                                          .blue,
                                                                      shape: RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(8)),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              0.0),
                                                                      child:
                                                                          Ink(
                                                                        decoration: BoxDecoration(
                                                                            gradient: LinearGradient(
                                                                              colors: [
                                                                                Color(0xff67b9fb),
                                                                                Color(0xff8acbff)
                                                                              ],
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                            ),
                                                                            borderRadius: BorderRadius.circular(25)),
                                                                        child:
                                                                            Container(
                                                                          constraints: BoxConstraints(
                                                                              maxWidth: 200.0,
                                                                              minHeight: 50.0),
                                                                          alignment:
                                                                              Alignment.center,
                                                                          child:
                                                                              Text(
                                                                            "Subscribe",
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                TextStyle(color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  : Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          CircularProgressIndicator(),
                                                                    ),
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    } else {
                                                      return Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            children: <Widget>[
                                                              Text(
                                                                  'Status: Unsubscribed', style: GoogleFonts.poppins(color: Colors.red),),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            15.0),
                                                                child: Text(
                                                                  'SUBSCRIBE NOW',
                                                                  style: GoogleFonts.poppins(color: Colors.blue, fontSize: 16,fontWeight: FontWeight.bold),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: webservices_consumer
                                                                            .login_state ==
                                                                        false
                                                                    ? RaisedButton(
                                                                        onPressed:
                                                                            () {
                                                                          Navigator
                                                                              .pushReplacement(
                                                                            context,
                                                                            PageRouteBuilder(
                                                                              pageBuilder: (context, animation, secondaryAnimation) {
                                                                                return SubscribePage();
                                                                              },
                                                                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                                                                return FadeTransition(
                                                                                  opacity: animation,
                                                                                  child: child,
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                        color: Colors
                                                                            .blue,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(4)),
                                                                        padding:
                                                                            EdgeInsets.all(0.0),
                                                                        child:
                                                                            Ink(
                                                                          decoration:
                                                                              BoxDecoration(borderRadius: BorderRadius.circular(4)),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
                                                                            alignment:
                                                                                Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              "Subscribe for \$4.99 / Month",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Padding(
                                                                        padding:
                                                                            const EdgeInsets.all(8.0),
                                                                        child:
                                                                            CircularProgressIndicator(),
                                                                      ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                  })
                                                ],
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircularProgressIndicator(),
                                          );
                                    ;
                                  },
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircularProgressIndicator(),
                                );
                        }),

//
                  ],
                ),
              ],
            ),
          );
        })));
  }
}
