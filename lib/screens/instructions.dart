import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class instructionPage extends StatefulWidget {
  instructionPage({Key key}) : super(key: key);



  @override
  _instructionPageState createState() => _instructionPageState();
}

class _instructionPageState extends State<instructionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height,
                height: 150.0,
                child: Image.asset(
                  'assets/images/logo.png',
                  // fit: BoxFit.fitHeight,
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  Container(

                    decoration: BoxDecoration(color: Colors.blue,),
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child:

                          Padding(
                            padding: const EdgeInsets.only(top: 10,left: 20,right: 20,),
                            child: Text('GETTING STARTED:',style: GoogleFonts.nunitoSans(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          )


                  )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,),
                          child: Text(
                            'Setting up your FoodTruck Express profile\n',
                            style:
                            TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                        Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                          child: Text(
                            'Welcome to FoodTruck.Express!',
                            style:
                            GoogleFonts.poppins(fontSize: 18),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10),
                          child: Text(
                            'Setting up your profile is a simple process but should not be overlooked.  Fill out the required fields in the profile manager correctly is important in how you are viewed by the app users.',
                            style:
                            TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                          child: Text(
                            '\nPROFILE IMAGE',
                            style:
                            GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),


                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            'We suggest a either a picture of your truck with the logo clearly visible or just your logo to clearly identify your brand.  We suggest jpg format with dimensions of 320 x 240 pixels.  \n\nThe details fields will populate your profile on the user end as shown in the following Image:',
                            style:
                            TextStyle(fontSize: 14, height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),

                  SizedBox(
                    height: 50,
                  ),
                  Container(

                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset('assets/images/profile-1.gif', width: 300,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                          child: Text(
                            'MENU ITEMS',
                            style:
                            GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),


                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            'A Foodtruck.Express subscription allows you to add menu items to your profile.  You can add new menu items buy hitting the -add menu item button.',
                            style:
                            TextStyle(fontSize: 14, height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset('assets/images/add-new.jpg', width: 300,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            'Each menu item consist of 3 fields, Title, Description and Price. You may also include an Image file.  320 x 240 jpg is recommended.',
                            style:
                            TextStyle(fontSize: 14, height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset('assets/images/menu.gif', width: 300,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 10),
                          child: Text(
                            'ONLINE VISIBILITY',
                            style:
                            GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),


                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Text(
                            'You can go offline by hitting the \'Power\' button at the top of the screen. When in offline mode you are not visible to users.',
                            style:
                            TextStyle(fontSize: 14, height: 1.5),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  Container(

                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Image.asset('assets/images/power.jpg', width: 300,),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: RaisedButton(
                  //     child: Text('Details'),
                  //     onPressed: () {
                  //       showAboutDialog(
                  //         context: context,
                  //         applicationIcon: FlutterLogo(),
                  //         applicationName: 'Made with Flutter',
                  //         applicationVersion: 'FoodTruck Express v1.3.0',
                  //         applicationLegalese: '© 2022 Wingu Digital',
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.only(top: 20,left: 50),
                  //             child: (
                  //       Text('Suggestions? ',style: TextStyle(height: 2),)
                  //       )
                  //           ),
                  //           Padding(
                  //               padding: const EdgeInsets.only(top: 10,left: 50),
                  //               child: (
                  //                   Image.asset('assets/images/wingu.png',fit: BoxFit.fitHeight,
                  //                     alignment: Alignment.center,)
                  //               )
                  //           ),
                  //         ]
                  //
                  //         // children: aboutBoxChildren,
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
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
          ],
        ),

      )
      ),

    );
  }
}
