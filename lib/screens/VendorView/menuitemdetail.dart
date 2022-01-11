import 'package:admob_flutter/admob_flutter.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:foodtruck/Services/LocationService.dart';
import 'package:foodtruck/Utils/utils.dart';
import 'package:foodtruck/Services/admob.dart'; //admob_flutter
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class menuitemdetail extends StatelessWidget {
  var menu_description;
  var vendor_phone;
  var menu_price;
  var menu_title;
  var menu_picture1;

  menuitemdetail(
      {this.menu_description,
      this.menu_title,
      this.menu_price,
      this.menu_picture1,
      this.vendor_phone});
  @override
  Widget build(BuildContext context) {
    var utils = Provider.of<Utils>(context, listen: false);
    return Scaffold(

      //admob_flutter
      bottomNavigationBar: Container(
          color: Colors.white,
          child: AdmobBanner(
            adUnitId: Provider.of<AdmobService>(context, listen: false)
                .getBannerAdUnitId(),
            adSize: AdmobBannerSize.BANNER,
            listener: (AdmobAdEvent event, Map<String, dynamic> args) {},
          )),
//

      appBar: AppBar(
        
        

        actions: <Widget>[

          Image.asset(
            'assets/images/ft.png',
            width: 100,
          ),
          SizedBox(
            width: 20,
          )
        ],

        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Menu Item',
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: const Color(0xff2699fb),
              height: 1.7),
          overflow: TextOverflow.visible,
        ),

        leading: InkWell(
            onTap: () {
              return Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
      ),

      backgroundColor: const Color(0xffffffff),
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: ExactAssetImage('assets/images/listbg.jpg'),
          ),

        ),

        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[

              Container(
                child: Carousel(
                  dotSize: 5,
                  dotSpacing: 15.0,
                  dotColor: Colors.blue,
                  indicatorBgPadding: 5.0,
                  // dotBgColor: Color(0xff2699fb).withOpacity(0.5),
                  boxFit: BoxFit.cover,
                  images: [
                    NetworkImage(menu_picture1.toString()),
                  ],
                ),
                height: 250.0,
              ),

              // Divider(),

              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.end,
                
                children: [
// title
              Padding(
                padding: const EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${menu_title.toString()}',
                    style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2699fb),
                        height: 1.7),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),

// to do :  add rating stars here 

              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Icon(Icons.favorite, color: Colors.blue,size: 30,),
              ),

                ],
              ),

              // Divider(),

// details
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Details:',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff2699fb),
                        ),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
// desc
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${menu_description.toString()}',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2699fb),
                        height: 1.7),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
SizedBox(height: 40,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  // price
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Price: \$${menu_price.toString()}',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2699fb),
                        height: 1.7),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),



// contact button 
              Container(
              
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      return utils.makePhoneCall('tel:$vendor_phone');
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(),
                      child: Container(
                        // constraints:
                        //     BoxConstraints(maxWidth: 180.0, minHeight: 50.0),
                        // alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 15,bottom: 15),
                          child: Row(
                            children: [
                              Text(
                                "Contact Vendor",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    height: 1.7),
                                overflow: TextOverflow.visible,
                              ),                              
                                  SizedBox(width: 5,),
                          Icon(Icons.phone, color: Colors.white,),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
],)


            ],
          ),
        ),
      ),
    );
  }
}
