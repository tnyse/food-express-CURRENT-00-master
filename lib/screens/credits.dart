import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class creditsPage extends StatefulWidget {
  creditsPage({Key key}) : super(key: key);

  @override
  _creditsPageState createState() => _creditsPageState();
}

class _creditsPageState extends State<creditsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              // height: 150.0,
              child: Image.asset(
                'assets/images/sub.jpg',
                fit: BoxFit.fitHeight,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 400,
                  ),
                  Container(
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child:

                          RichText(
                              text: TextSpan(
                                  text: 'FOODTRUCK.EXPRESS' ,style: TextStyle(
                                  color: Colors.black, fontSize: 25,fontWeight: FontWeight.normal ),
                                  children: const <TextSpan> [

                                    TextSpan(text: ' v', style: TextStyle(fontSize: 11, fontWeight: FontWeight.normal)),
                                    TextSpan(text: '1.3', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16)),

                                  ]
                              )
                          )


                      )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Locate your favorite food trucks instantly!\n',
                          style:
                          TextStyle(fontSize: 14),
                          textAlign: TextAlign.left,
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //     child: Align(
                  //       alignment: Alignment.centerLeft,
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(bottom: 10),
                  //         child: Image.asset('assets/images/wingu.png'
                  //
                  //         ),
                  //       ),
                  //     )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Concept, UI Design, and Development:',
                            style:
                            TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      )),
                  Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '- Tony Minter\n- Franklyn Ediku',
                          style:
                          TextStyle(fontSize: 12, height: 1.5),
                          textAlign: TextAlign.left,
                        ),
                      )),

                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: RaisedButton(
                      color: Colors.blue,
                      child: Text('Details',style: GoogleFonts.poppins(color: Colors.white),),
                      onPressed: () {
                        showAboutDialog(

                            context: context,
                            applicationIcon: Image.asset('assets/images/logo.png', height: 90,),
                            applicationName: 'FoodTruck Express',
                            applicationVersion: 'v1.3.0',
                            applicationLegalese: '© 2022 Wingu Digital',
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: (
                                      Text('For suggestions, comments or contact visit \nhttps://www.foodtruck.express',style: TextStyle(fontSize: 11,height: 1.1),)
                                  )
                              ),

                            ]

                          // children: aboutBoxChildren,
                        );
                      },
                    ),
                  ),
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
      )),
    );
  }
}
