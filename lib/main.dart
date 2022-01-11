import 'dart:async';
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:foodtruck/Utils/provider_util.dart';
import 'package:foodtruck/Utils/utils.dart';
// import 'package:foodtruck/screens/GSignIn.dart';
import 'package:foodtruck/Services/admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:statusbar/statusbar.dart';

import 'screens/Login_SignupView/Ntro.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() async {
  await GetStorage.init();
  String getAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-1065880110189655~2487853650';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-1065880110189655~2487853650';
    }
    return null;
  }


  Provider.debugCheckInvalidValueType = null;
  Admob.initialize(testDeviceIds: [getAppId()]);
  // Run this before displaying any ad.



  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocationService>(
        create: (context) => LocationService(),
      ),
      ChangeNotifierProvider<SetState>(
        create: (context) => SetState(),
      ),
      ChangeNotifierProvider<WebServices>(
        create: (context) => WebServices(),
      ),
      ChangeNotifierProvider<Utils>(
        create: (context) => Utils(),
      ),
      ChangeNotifierProvider<AdmobService>(
        create: (context) => AdmobService(),
      ),
    ],
    child: StartApp(),
  ));
}

class StartApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StartAppState();
  }
}

class StartAppState extends State<StartApp> {
  @override
  void initState() {
    super.initState();
    StatusBar.color(Colors.blue);
    Provider.of<LocationService>(context, listen: false).getCurrentLocation();
    //Get current location every 5 minutes.
    Timer.periodic(Duration(minutes: 8), (timer) {
      Provider.of<LocationService>(context, listen: false).getCurrentLocation();
      final box = GetStorage();
      var user = box.read('user');

// get user location

      if (user == 'user') {
        Provider.of<WebServices>(context, listen: false)
            .get_current_user_location()
            .then((value) {
          Provider.of<WebServices>(context, listen: false).Update_User_Location(
            id: value[0].id,
            context: context,
          );
        });
      }

// get vendor location

      if (user == "vendor") {
        Provider.of<WebServices>(context, listen: false)
            .get_current_vendor_location()
            .then((value) {
          Provider.of<WebServices>(context, listen: false)
              .Update_Vendor_Location(
            id: value[0].id,
            context: context,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return SPLASH();
    return OnBoardingPage();
    //SignInDemo();
  }
}
