import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/UserView/Map_user.dart';
import 'package:foodtruck/screens/VendorView/ManageVendorSubScription.dart';
import 'package:foodtruck/screens/VendorView/SetNewDefaultCard.dart';
import 'package:foodtruck/screens/VendorView/VendorProfileedit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtruck/screens/VendorView/VendorMenuPage.dart';
import 'package:foodtruck/Services/admob.dart';  // admob_flutter
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VENDORprofile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return VENDORprofilestate();
  }
}

class VENDORprofilestate extends State<VENDORprofile> {
  var online_offline_value = true;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var webservices = Provider.of<WebServices>(context, listen: false);
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
//////

      key: scaffoldKey,
      backgroundColor: const Color(0xffffffff),
      body: WillPopScope(
        onWillPop: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  Map_user()));
        },
        child: FutureBuilder(
          future: webservices.Vendor_Profile_Api(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  Stack(
//                  alignment: Alignment.center,
                    children: <Widget>[
//header bg image
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250.0,
                        // child: Image.asset(snapshot.data[0].pro_pic),
                        child: Image.asset(
                          'assets/images/bg2.png',
                          fit: BoxFit.fill,
                        ),
                      ),
// profile circle

                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, bottom: 8.0, left: 270, right: 10),
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 5,
                          shape: BoxShape.circle,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage:
                                NetworkImage(snapshot.data[0].pro_pic),
                            radius: 45,
                            child: Text(''),
                          ),
                        ),
                      ),
// back button
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) =>
                                  Map_user()));
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
 //  vendor detail
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                            child: Padding(
                          padding: EdgeInsets.only(top: 210.0, left: 20, right: 8),
                          child: Text(
                            snapshot.data[0].unique_detail,
                            style: GoogleFonts.poppins(


                              fontSize: 14,
                              color:  Colors.black54,
                              height: 1.7142857142857142,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ),
 // vendor business name
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 155.0, left: 20),
                          child: SizedBox(
                            height: 45.0,
                            child: Text(
                              snapshot.data[0].business_name,
                              style: GoogleFonts.poppins(
                                // fontFamily: 'Arial',
                                fontSize: 30,
                                color: Colors.black54,
                                height: 1,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              softWrap: true,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ),
                      ),
 // telephone
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: 190, left: 20),
                          child: Text(
                            'Tel:' + ' ' + snapshot.data[0].phone,
                            style: GoogleFonts.poppins(fontSize: 16,color: Colors.black54),
                            // TextStyle(
                            //   fontFamily: 'Arial',
                            //   fontSize: 16,
                            //   color: Colors.blue,
                            //   height: 1,
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
//  off/online toggle
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: <Widget>[
                          FutureBuilder(
                              future: webservices.get_current_vendor_location(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Switch(
                                    value: snapshot.data[0].online,
                                    onChanged: (value) {
                                      if (snapshot.data[0].online == true) {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          scaffoldKey: scaffoldKey,
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: false,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'offline',
                                          color_value: Colors.red,
                                        ).then((value) => setState(() {}));
                                        webservices.Login_SetState();
                                      } else {
                                        webservices
                                            .Update_Vendor_to_Online_Offline(
                                          scaffoldKey: scaffoldKey,
                                          context: context,
                                          lan: snapshot.data[0].Lan,
                                          log: snapshot.data[0].Log,
                                          online_offline: true,
                                          id: snapshot.data[0].id,
                                          online_offline_value: 'online',
                                          color_value: Colors.lightGreen,
                                        ).then((value) => setState(() {}));
                                        webservices.Login_SetState();
                                      }
                                    },
                                  );
                                }
                                return Text('Loading');
                              }),
                          Text(
                            'ONLINE/OFFLINE',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              height: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
 // change profile button
                  // Padding(
                  //   padding: const EdgeInsets.all(15.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Column(
                  //         children: <Widget>[
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //                 top: 8.0, bottom: 8.0, right: 8.0),
                  //             child: CircleAvatar(
                  //               backgroundColor: Colors.white,
                  //               backgroundImage:
                  //                   NetworkImage(snapshot.data[0].pro_pic),
                  //               radius: 70,
                  //               child: Text(''),
                  //             ),
                  //           ),
                  //           // Center(
                  //           //   child:
                  //           //   RaisedButton(
                  //           //     color: Colors.blue,
                  //           //     onPressed: () {
                  //           //       return Navigator.push(
                  //           //         context,
                  //           //         PageRouteBuilder(
                  //           //           pageBuilder: (context, animation,
                  //           //               secondaryAnimation) {
                  //           //             return VENDORprofileEdith(
                  //           //               snapshot_profile_data: snapshot.data[0],
                  //           //             );
                  //           //           },
                  //           //           transitionsBuilder: (context, animation,
                  //           //               secondaryAnimation, child) {
                  //           //             return FadeTransition(
                  //           //               opacity: animation,
                  //           //               child: child,
                  //           //             );
                  //           //           },
                  //           //         ),
                  //           //       );
                  //           //     },
                  //           //     shape: RoundedRectangleBorder(
                  //           //         borderRadius: BorderRadius.circular(18)),
                  //           //     child: Container(
                  //           //       alignment: Alignment.center,
                  //           //       child: Padding(
                  //           //         padding: const EdgeInsets.all(5.0),
                  //           //         child: Text(
                  //           //           "Change Profile Picture",
                  //           //           textAlign: TextAlign.center,
                  //           //           style: TextStyle(color: Colors.white),
                  //           //         ),
                  //           //       ),
                  //           //     ),
                  //           //   ),
                  //           // ),
                  //         ],
                  //       ),
                  //       Container(
                  //         child: VerticalDivider(),
                  //         height: 40,
                  //       ),
                  //       // Text(
                  //       //   'Tel:' + snapshot.data[0].phone,
                  //       //   style: TextStyle(
                  //       //     fontFamily: 'Arial',
                  //       //     fontSize: 16,
                  //       //     color: Colors.black54,
                  //       //     height: 1,
                  //       //   ),
                  //       // ),
                  //     ],
                  //   ),
                  // ),

//detail
                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Text(
                  //     snapshot.data[0].detail,
                  //     style: TextStyle(
                  //       fontFamily: 'Arial',
                  //       fontSize: 14,
                  //       color: Colors.black54,
                  //       height: 1,
 SizedBox(
              height: 50.0,
            ),
                  //     ),
                  //     textAlign: TextAlign.center,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          trailing:
                              Icon(Icons.description, color: Colors.blue),
                          title: Text(
                            'Edit Your Profile Details',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            return Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return VENDORprofileEdith(
                                    snapshot_profile_data: snapshot.data[0],
                                  );
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          trailing:
                              Icon(Icons.fastfood, color: Colors.blue),
                          title: Text(
                            'Menu Items',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            return Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return VendorMenuPage(
                                    snapshot_profile_data: snapshot.data[0],
                                  );
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
 // manage subscription
                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                    child: Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Card(
                        elevation: 2,
                        child: ListTile(
                          trailing: Icon(
                            FontAwesomeIcons.cloudversify,
                            color: Colors.blue,
                          ),
                          title: Text(
                            'Manage Subscription Plan',
                            style: TextStyle(color: Colors.black54),
                          ),
                          onTap: () {
                            return Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return managesubscription(snapshot.data[0].id);
                                },
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
   // payment card
   //                Padding(
   //                  padding: const EdgeInsets.all(8.0),
   //                  child: Container(
   //                    decoration:
   //                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
   //                    child: Card(
   //                      elevation: 2,
   //                      child: ListTile(
   //                        trailing: Icon(
   //                          FontAwesomeIcons.ccVisa,
   //                          color: Color(0xFF67b9fb),
   //                        ),
   //                        title: Text(
   //                          'Set New Payment Card',
   //                          style: TextStyle(color: Colors.black54),
   //                        ),
   //                        onTap: () {
   //                          return Navigator.push(
   //                            context,
   //                            PageRouteBuilder(
   //                              pageBuilder:
   //                                  (context, animation, secondaryAnimation) {
   //                                return vendoraddcard();
   //                              },
   //                              transitionsBuilder: (context, animation,
   //                                  secondaryAnimation, child) {
   //                                return FadeTransition(
   //                                  opacity: animation,
   //                                  child: child,
   //                                );
   //                              },
   //                            ),
   //                          );
   //                        },
   //                      ),
   //                    ),
   //                  ),
   //                ),
                ],
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),



    );
  }
}
