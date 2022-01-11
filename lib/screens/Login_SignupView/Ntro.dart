import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/Network.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:foodtruck/screens/SPLASH.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrader/upgrader.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:introduction_screen/introduction_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:foodtruck/main.dart';
import 'package:foodtruck/screens/Login_SignupView/SIGNUP.dart';
import 'login.dart';
import 'package:foodtruck/screens/UserView/Map_user.dart';
import '../VendorView/MAp_vendor.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    // );

    return MaterialApp(
      title: 'Introduction screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  // await Admob.requestTrackingAuthorization();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final box = GetStorage();
      if(Platform.isIOS){
        box.read('permission') == null|| box.read('permission') == 'null' || box.read('permission') == ''?callPermission(context):null;
      }
    });
  }

  callPermission(context){
    return showDialog(
        barrierDismissible: false,
        context: context, builder: (context){
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 150,
          width: 300,
          child: AlertDialog(
            content: Container(
              // height: 150,
              height: MediaQuery.of(context).size.height*.40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                Text('PERMISSIONS REQUEST'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('FoodTruck Express contains ads that your IOS device requires permissions from you to display properly.\n\nDo you wish to proceed?'),
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
                              onPressed: () async{
                                await Admob.requestTrackingAuthorization();
                                Navigator.pop(context);
                                final box = GetStorage();
                                box.write('permission', true);
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
                               exit(0);
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
      );
    });
  }
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/images/sub.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
  Widget _createAccountPage(){
    return Center(
      // widthFactor: MediaQuery.of(context).size.height * 0.8,
      child: Column(

        children: [
          Image.asset('assets/images/ntro-login.gif',width: MediaQuery.of(context).size.width * 0.8,),
          SizedBox(height: 30,),

          Text('Create An Account',style: TextStyle(fontSize: 24,color: Colors.black87,fontWeight: FontWeight.bold)),
          Text('And Log in as the desired user type',style: TextStyle(fontSize: 12,color: Colors.black87)),
          SizedBox(height: 10,),
          RichText(text: TextSpan(
            children: <TextSpan>[


              TextSpan(text: '\nUSER: \n ', style: TextStyle(fontSize: 18,color: Colors.blue,height: .5)),
              TextSpan(text: 'if you\'re looking for a food truck\n', style: TextStyle(fontSize: 18,color: Colors.black87)),
              TextSpan(text: '\n\nVENDOR:  \n', style: TextStyle(fontSize: 18,color: Colors.blue,height: .5)),
              TextSpan(text: 'if you want your truck to be found.', style: TextStyle(fontSize: 18,color: Colors.black87)),


            ]
          ))
        ],
      ),
    );
  }
  ////

  ////

  Widget _buildImage(String assetName, [double width = 300]) {
    return Image.asset('assets/images/$assetName', width: width);
  }
  Widget _buildNtroImage(String assetName, [double width = 250]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('ft.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,

        child: ElevatedButton(
          child: const Text(
            'Let\s get to it!',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Welcome!",
          body:
              "Learn how to use the app in a few easy steps.",
          image: _buildNtroImage('logo.png'),
          decoration: pageDecoration,
        ),

       PageViewModel(
         title: '',
         bodyWidget: _createAccountPage(),
         decoration: pageDecoration,
       ),
        PageViewModel(
          title: "View the list",
          body:
              "Preview the list of available food trucks in your area sorted by distance from your current location.",
          image: _buildImage('ntro-map.gif'),
          decoration: pageDecoration,

        ),
        PageViewModel(
          title: "Enjoy!",
          body:
              "We hope you enjoy using Foodtruck Express!",
          image: _buildFullscreenImage(),

          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 30),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 2,

          ),
        ),

      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      //rtl: true, // Display as right-to-left
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SPLASH();
  }
}