import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/screens/Login_SignupView/login.dart';
import 'package:foodtruck/screens/VendorView/ManageVendorSubScription.dart';
import 'package:foodtruck/screens/credits.dart';
import 'package:foodtruck/screens/instructions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:foodtruck/screens/VendorView/VENDORprofile.dart';
import 'package:foodtruck/screens/instructions.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart' show rootBundle;

String _mapStyle;

class Map_user extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Map_vendorSample();
  }
}

class Map_vendorSample extends StatefulWidget {
  @override
  State<Map_vendorSample> createState() => Map_vendorSampleState();
}

const DrawerButtonTxt = TextStyle(
  color: Colors.white,
  fontSize: 18,
);
class Map_vendorSampleState extends State<Map_vendorSample> {
  GlobalKey<ScaffoldState> scaffold_key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocationPermission();
  }


  checkLocationPermission()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var permission = prefs.getBool('permission');

    return   permission == null || permission == false?showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
      return WillPopScope(
        onWillPop: (){},
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))),
            content: Container(
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Notice',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 250,
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: Center(
                          child: Text(
                            'Accepting location permission is necessary for the app to function',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(26),
                          elevation: 2,
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,),
                                borderRadius:
                                BorderRadius.circular(26)),
                            child: FlatButton(
                              onPressed: () {
                                return exit(0);
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(26)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(26)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 190.0, minHeight: 53.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Exit",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(26),
                          elevation: 2,
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue,),
                                borderRadius:
                                BorderRadius.circular(26)),
                            child: FlatButton(
                              onPressed:() async{
                                Map<Permission, PermissionStatus> statuses = await [
                                  Permission.notification,
                                  Permission.accessNotificationPolicy,
                                  Permission.locationAlways,
                                ].request().then((value){
                                  Navigator.pop(context);
                                  prefs.setBool('permission', true);
                                });
                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(26)),
                              padding: EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(26)),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 190.0, minHeight: 53.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Grant Access",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      );
    }):null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffold_key,
      drawer: SafeArea(
        child: SizedBox(
          width: 250,
          child: Drawer(
            
            child: Container(
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: Center(
                        child: Container(
                            // width: 150,
                            height: 120,
                            child: Image.asset('assets/images/drawer-head.png')),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return VENDORprofile();
                      }));
                    },
                    title: Text('PROFILE MANAGER',style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),),
                    leading: Icon(Icons.settings,color: Colors.white),
                  ),
                  Divider(),
                  /// todo add share function
                  // ListTile(
                  //   onTap: () {
                  //     Navigator.of(context)
                  //         .push(MaterialPageRoute(builder: (context) {
                  //       return VENDORprofile();
                  //     }));
                  //   },
                  //   title: Text('SHARE',style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),),
                  //   leading: Icon(Icons.share,color: Colors.white),
                  // ),
                  // Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return instructionPage();
                      }));
                    },
                    title: Text('INSTRUCTIONS',style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),),
                    leading: Icon(Icons.info,color: Colors.white),
                  ),
                  Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return creditsPage();
                      }));
                    },
                    title: Text('ABOUT APP',style: GoogleFonts.poppins(fontSize: 12,color: Colors.white),),
                    leading: Icon(Icons.info_outline,color: Colors.white),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,

        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.blue,
          onPressed: () {
            scaffold_key.currentState.openDrawer();
          },
        ),

        actions: <Widget>[
          // Image.asset(
          //   'assets/images/ft.png',
          //   width: 110,
          // ),
          IconButton(
            icon: Icon(Icons.power_settings_new),
            color: Colors.blue,
            onPressed: () async {
              showDialog(
                  builder: (context) => BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: AlertDialog(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(4.0))),
                      content: Container(
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Oops!!',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Center(
                                    child: Text(
                                      'DO YOU WANT TO SIGN OUT?',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ButtonBar(
                                alignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(26),
                                    elevation: 2,
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.blue),
                                          borderRadius:
                                          BorderRadius.circular(26)),
                                      child: FlatButton(
                                        onPressed: () {
                                          final box = GetStorage();
                                          box.remove('token');
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context, animation, secondaryAnimation) {
                                                  return Login();
                                                },
                                                transitionsBuilder:
                                                    (context, animation, secondaryAnimation, child) {
                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  );
                                                },
                                              ),
                                                  (Route<dynamic> route) => false
                                          );
                                        },
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(26)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(26)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 190.0,
                                                minHeight: 53.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Yes",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                // fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    borderRadius: BorderRadius.circular(26),
                                    elevation: 2,
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          border:
                                          Border.all(color: Colors.blue),
                                          borderRadius:
                                          BorderRadius.circular(26)),
                                      child: FlatButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        color: Colors.blue,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(26)),
                                        padding: EdgeInsets.all(0.0),
                                        child: Ink(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(26)),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 190.0,
                                                minHeight: 53.0),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "No",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                // fontStyle: FontStyle.italic,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                  context: context);
            },
          ),

        ],
        backgroundColor: Colors.white.withOpacity(.2),
        centerTitle: false,
        title: Text(
          'Current Position',
          style: GoogleFonts.poppins(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),
          overflow: TextOverflow.visible,
        ),
      ),
      body: bodywidget(),
    );
  }
}

class bodywidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bodywidgetstate();
  }
}

class bodywidgetstate extends State<bodywidget> {
  BitmapDescriptor custom_home_marker;
  BitmapDescriptor custom_user_marker;

// style the map
  @override
   initState() {
    super.initState();
    // _mapStyle = bodywidgetstate.loadString('assets/mapstyle.txt');
    rootBundle.loadString('assets/mapstyle.txt').then((string) {
      _mapStyle = string;
    });


    if(Platform.isIOS){
      //icon for ios only

      BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1.5, 1.5)),
          'assets/images/IOShomemarker.png')
          .then((v) {
        custom_home_marker = v;
      });
    } else if(Platform.isAndroid){
      //icon for andriod and other platform

      BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1.5, 1.5)),
          'assets/images/home.png')
          .then((v) {
        custom_home_marker = v;
      });
    }


    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(1.5, 1.5)),
        'assets/images/usermarkerBlue.png')
        .then((v) {
      custom_user_marker = v;
    });


  }

  Completer<GoogleMapController> _controller = Completer();
  // String _mapStyle;
  var marker = Set<Marker>();
  var zoom_value = 11.0;
  var index_value;
  var range_value = 5.0;

  int dropdownvalue = 5;

  var items =  [5, 10, 15, 20, 25, 30];

  @override
  Widget build(BuildContext context) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    var webservices = Provider.of<WebServices>(context, listen: false);
    // TODO: implement build
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            builder: (context) => BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                  child: AlertDialog(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Container(
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Oops!!',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: Center(
                                  child: Text(
                                    'DO YOU WANT TO EXIT THE APP?',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(26),
                                  elevation: 2,
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(26)),
                                    child: FlatButton(
                                      onPressed: () {
                                        return exit(0);
                                      },
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(26)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 190.0, minHeight: 53.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Yes",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  borderRadius: BorderRadius.circular(26),
                                  elevation: 2,
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(26)),
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(26)),
                                        child: Container(
                                          constraints: BoxConstraints(
                                              maxWidth: 190.0, minHeight: 53.0),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "No",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              // fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
            context: context);
      },
      child: FutureBuilder(
          future: webservices.Vendor_Profile_Api(),
          builder: (context, snapshot_profile) {
            return snapshot_profile.hasData
                ? FutureBuilder(
                    future: webservices.get_vender_subscription_id(),
                    builder: (context, subscription_id_snapshot) {
                      return subscription_id_snapshot.hasData
                          ? FutureBuilder(
                              future: webservices.get_all_user_current_location(
                                context: context,
                                location_latitude:
                                    locationValues.location_latitude,
                                location_longtitude:
                                    locationValues.location_longitude,
                                range_value: range_value,
                                subscription_id: subscription_id_snapshot
                                    .data['subscription_id'],
                              ),
                              builder: (context, snapshots) {
                                if (snapshots.hasData) {
                                  if (snapshots.data == 'Free Account'  || snapshots.data=='Subscribe to get online Users and Display your Menu') {
                                    return SubscriptionView(
                                        snapshots,
                                        snapshot_profile.data[0].id);
                                  } else if (snapshots.data ==
                                          'Connection Error' ||
                                      snapshots.data == 'MENU IS UNAVAILABLE') {
                                    return ConnectionErrorView(
                                        snapshots);
                                  } else {
                                    return CurrentUserView(
                                        snapshots);
                                  }
                                } else if (snapshots.hasError) {
                                  return Text('${snapshots.error}');
                                }
                                return Center(
                                    child: CupertinoActivityIndicator(
                                  radius: 20,
                                ));
                              })
                          : Center(
                              child: CupertinoActivityIndicator(
                              radius: 20,
                            ));
                    })
                : Center(
                    child: CupertinoActivityIndicator(
                    radius: 20,
                  ));
          }),
    );
  }

  Widget CurrentUserView(snapshots) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        marker.clear();
        for (index_value in snapshots.data) {
          marker.add(Marker(
              markerId: MarkerId(index_value.user.toString()),
              icon: custom_home_marker,   // custom users
              // icon: BitmapDescriptor.defaultMarker,
              position: LatLng(double.parse(index_value.Lan),
                  double.parse(index_value.Log))));
        }

        return Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,

                initialCameraPosition: CameraPosition(
                  zoom: zoom_value,
                  target: LatLng(locationValues.location_latitude,
                      locationValues.location_longitude),
                ),
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                  controller.setMapStyle(_mapStyle);

                  // mapController.setMapStyle(_mapStyle);
                },
                markers: marker,
              ),
            ),
            //
            // Padding(
            //   padding: const EdgeInsets.only(
            //     bottom: 8.0,
            //   ),
            //   child: Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Container(
            //       width: double.infinity,
            //       height: 120,
            //       child: PageView.builder(
            //         controller: PageController(viewportFraction: 0.8),
            //         onPageChanged: (index) async {
            //           // GoogleMapController controller = await _controller.future;
            //           // return controller.animateCamera(
            //           //     CameraUpdate.newCameraPosition(CameraPosition(
            //           //         bearing: 45,
            //           //         tilt: 50,
            //           //         zoom: 16,
            //           //         target: LatLng(
            //           //           double.parse(snapshots.data[index].Lan),
            //           //           double.parse(snapshots.data[index].Log),
            //           //         ))));
            //         },
            //         itemCount: snapshots.data.length,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (context, index) {
            //           return Builder(
            //             builder: (context) {
            //               if (snapshots.connectionState ==
            //                   ConnectionState.done) {
            //                 return FittedBox(
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(6),
            //                     child: Container(
            //                       width: 250,
            //                       height: 140,
            //                       child: Card(
            //                         color: Color(0xFF67b9fb).withOpacity(0.2),
            //                         child: Container(
            //                           width: 250,
            //                           child: Column(
            //                             children: <Widget>[
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                     left: 8.0, right: 8),
            //                                 child: InkWell(
            //                                   onTap: () async {
            //                                     GoogleMapController controller =
            //                                         await _controller.future;
            //                                     return controller.animateCamera(
            //                                         CameraUpdate
            //                                             .newCameraPosition(
            //                                                 CameraPosition(
            //                                                     bearing: 45,
            //                                                     tilt: 50,
            //                                                     zoom: 17,
            //                                                     target: LatLng(
            //                                                       double.parse(
            //                                                           snapshots
            //                                                               .data[
            //                                                                   index]
            //                                                               .Lan),
            //                                                       double.parse(
            //                                                           snapshots
            //                                                               .data[
            //                                                                   index]
            //                                                               .Log),
            //                                                     ))));
            //                                   },
            //                                   child: Container(
            //                                     height: 60,
            //                                     width: 60,
            //                                     decoration: BoxDecoration(
            //                                       gradient: LinearGradient(
            //                                         colors: [
            //                                           Color(0xff8acbff),
            //                                           Color(0xff67b9fb)
            //                                         ],
            //                                         begin: Alignment.centerLeft,
            //                                         end: Alignment.centerRight,
            //                                       ),
            //                                       shape: BoxShape.circle,
            //                                       color: Colors.lightBlue,
            //                                     ),
            //                                     margin: const EdgeInsets.only(
            //                                         top: 5.0, bottom: 5),
            //                                     child: Center(
            //                                       child: Text(
            //                                         'Focus\n View',
            //                                         style: TextStyle(
            //                                           fontSize: 11,
            //                                           fontFamily: 'Futura',
            //                                           color: Colors.white,
            //                                           fontWeight:
            //                                               FontWeight.bold,
            //                                         ),
            //                                       ),
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ),
            //                               SizedBox(
            //                                 width: 150,
            //                                 child: Divider(
            //                                   color: Colors.black,
            //                                   indent: 5,
            //                                 ),
            //                               ),
            //                               Padding(
            //                                 padding: const EdgeInsets.only(
            //                                   left: 8.0,
            //                                   right: 8,
            //                                 ),
            //                                 child: Text(
            //                                   '${snapshots.data[index].distance} ' +
            //                                       ' MILES AWAY',
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.white,
            //                                       fontSize: 11),
            //                                   softWrap: false,
            //                                   maxLines: 1,
            //                                   overflow: TextOverflow.fade,
            //                                 ),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 );
            //               } else {
            //                 return Center(
            //                     child: CupertinoActivityIndicator(
            //                   radius: 20,
            //                 ));
            //               }
            //             },
            //           );
            //         },
            //       ),
            //     ),
            //   ),
            // ),


            Container(
              decoration: BoxDecoration(color: Colors.blue.withOpacity(.3),
            
              
              borderRadius: BorderRadius.only(
                    // bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(10),
                  ),
                //   boxShadow: [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0.0, 1.0), //(x,y)
                //     blurRadius: 6.0,
                //   ),
                // ],
                  
              ),
              
              
              child: Padding(
                
                padding: const EdgeInsets.only(left: 20, top: 10,right: 10,bottom: 1),
                
                child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: Colors.blue.withOpacity(.9)),
                  child: Row(
                    children: [
                      Text('User Detection Radius ',
                      style: GoogleFonts.poppins(color: Colors.white),),
                      DropdownButton(
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),


                        items: items.map((int items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(' '.toUpperCase()+items.toString()+' MILES',
                              style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.white)
                              // TextStyle(color: Colors.white,fontSize: 12, fontWeight:FontWeight.w600 ),
                              )
                          );
                        }
                        ).toList(),
                        onChanged: (int newValue){
                          setState((){
                            dropdownvalue = newValue;
                            adjust(newValue);
                            range_value = double.parse(dropdownvalue.toString());
                            bodywidget();

                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 10, top: 20),
                child: InkWell(
                  onTap: () async {
                    var locationValues = Provider.of<LocationService>(context, listen: false);
                    GoogleMapController controller =
                    await _controller.future;
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: zoom_value,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
                  },
                  child: Container(
                    height: 60,
                    width: 60,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xff8acbff).withOpacity(.9),
                          Color(0xff67b9fb).withOpacity(.9)
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      shape: BoxShape.circle,
                      color: Colors.lightBlue,
                    ),
                    margin: const EdgeInsets.only(
                        top: 1.0, bottom: 5),
                    child: Center(
                      child: 
                      Icon(
          Icons.my_location,
          color: Colors.white,
          size: 30.0,
          textDirection: TextDirection.ltr,
          semanticLabel: 'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
        ),
                      
                      // Text(
                      //   'Recenter\n View',
                      //   style: TextStyle(
                      //     fontSize: 11,
                      //     fontFamily: 'Futura',
                      //     color: Colors.white,
                      //     fontWeight:
                      //     FontWeight.bold,
                      //   ),
                      //   textAlign: TextAlign.center,
                      // ),
                     
                      
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }




adjust(range)async{
    var locationValues = Provider.of<LocationService>(context, listen: false);
     GoogleMapController controller =
                    await _controller.future;
  if(range == 30){
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 11,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }else if(range == 25){
  
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 12,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }else if(range == 20){
    
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 13,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }else if(range == 15){
      
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 14,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }else if(range == 10){
       
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 15,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }else if(range == 5){
      
                    return controller.animateCamera(
                        CameraUpdate
                            .newCameraPosition(
                            CameraPosition(
                              zoom: 16,
                              target: LatLng(locationValues.location_latitude,
                                  locationValues.location_longitude),
                                )));
  }

}



  Widget ConnectionErrorView(snapshots) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                markers: {
                  Marker(
                      markerId: MarkerId('user'),
                      icon: custom_user_marker,
                      // icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(locationValues.location_latitude,
                          locationValues.location_longitude))
                },
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  zoom: zoom_value,
                  target: LatLng(locationValues.location_latitude,
                      locationValues.location_longitude),
                ),
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                  controller.setMapStyle(_mapStyle);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 120,
                      child: Card(
                        child: Container(
                          width: 250,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8,
                                  top: 40,
                                ),
                                child: Text(
                                  '${snapshots.data}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget SubscriptionView(snapshots, snapshotprofile) {
    var locationValues = Provider.of<LocationService>(context, listen: false);
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: <Widget>[
            Container(
              child: GoogleMap(
                myLocationEnabled: true,  //show vendor location ???
                markers: {
                  Marker(
                      markerId: MarkerId('user'),
                      // unsubscribed vendor home marker
                      icon: custom_home_marker,
                      // icon: BitmapDescriptor.defaultMarker,
                      position: LatLng(locationValues.location_latitude,
                          locationValues.location_longitude))
                },
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  zoom: zoom_value,
                  target: LatLng(locationValues.location_latitude,
                      locationValues.location_longitude),
                ),
                onMapCreated: (GoogleMapController controller) async {
                  _controller.complete(controller);
                  controller.setMapStyle(_mapStyle);
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(

                height: 120,
                child: FittedBox(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      
                      height: 120,
                      child: Card(
                        child: Container(
                          width: 250,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, right: 8),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,top: 20,

                                ),
                                child: Text(

                                  '${snapshots.data}',
                                  style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontSize: 12),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: ActionChip(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                            secondaryAnimation) {
                                          return managesubscription(
                                              snapshotprofile);
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
                                  elevation: 2,
                                  backgroundColor: Colors.blue,
                                  label: Container(
                                    margin: const EdgeInsets.only(
                                        top: 5.0, bottom: 5),
                                    child: Text(
                                      'Subscribe',
                                      style: GoogleFonts.poppins(color: Colors.white)
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  static loadString(String s) {}
}
