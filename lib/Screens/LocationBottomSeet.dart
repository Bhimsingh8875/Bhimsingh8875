import 'package:flutter/material.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../Colors/COLORS.dart';

class LocationBottomSeet extends StatefulWidget {
  const LocationBottomSeet({super.key});

  @override
  State<LocationBottomSeet> createState() => _LocationBottomSeetState();
}

class _LocationBottomSeetState extends State<LocationBottomSeet> {


   TextEditingController searchLocationCantroller = TextEditingController();
 var h;
  var w;

  @override
  Widget build(BuildContext context) {
  
    h = MediaQuery.of(context).size.height;
    w =MediaQuery.of(context).size.width;
    return Container(
      height: h*0.6,
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Padding(
        padding:  EdgeInsets.only(top: h*0.020,right: w*0.035,left: w*0.030),
        child: Column(children: [


                             Align(alignment: Alignment.bottomRight,
                              child: GestureDetector(
                              onTap: ()=>Navigator.of(context).pop(),
                                child: styleText("Done", GREEN_CLR, FontWeight.bold, 13))),

                                   Container(
                                      alignment: Alignment.center,
                                      height: h*0.07,
                                      margin: EdgeInsets.only(top: h * 0.035),
                                  decoration: BoxDecoration(
                              
                                    color: WHITE_CLR,
                                    borderRadius: BorderRadius.circular(15),
                                   border: Border.all(color: BORDER_CLR,width: 1)
                                    
                                  ),
                                      child: TextFormField(
                                        controller: searchLocationCantroller,
                                        decoration: InputDecoration(
                                          errorText: "",
                                          errorStyle: TextStyle(height: 0),
                                            hintText: "Location",
                                            hintStyle: TextStyle(
                                                color: GRAY_CLR,
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal),
                                            prefixIcon: Icon(
                                              Icons.location_on,
                                              color: GREEN_CLR,
                                              size: 20,
                                            ),
            
                                            suffixIcon:Icon(Icons.gps_fixed_sharp,size: 17,color: GRAY_CLR,) ,
                                            border: InputBorder.none)),
                                    
                                      ),




                                      Container(
                                      alignment: Alignment.center,
                                      height: h*0.4,
                                      margin: EdgeInsets.only(top: h * 0.020),
                                  decoration: BoxDecoration(
                              
                                    color: WHITE_CLR,
                                    borderRadius: BorderRadius.circular(15),
                                   border: Border.all(color: BORDER_CLR,width: 1)
                                    
                                  ),

                                  child: SizedBox(
                                    height: h*0.35,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      itemBuilder: (BuildContext context, int index) {  
                                      return Padding(
                                      padding:  EdgeInsets.only(top: h*0.020,right: w*0.030,left: w*0.030),
                                        child: Column(
                                          children: [
                                            Row(children: [
                                              Icon(Icons.location_on,color: GRAY_CLR,size: 20,),
                                              SizedBox(width: 10,),
                                              styleText("27/2,Mansarover Jaipur,302033", GRAY_CLR, FontWeight.normal, 12)
                                            ]),
                                    
                                            Divider(color: GRAY_CLR.withOpacity(0.3),thickness: 1,)
                                          ],
                                        ),
                                      );
                                      }
                                    ),
                                  ),
                                      // child: TextFormField(
                                      //   controller: searchLocationCantroller,
                                      //   decoration: InputDecoration(
                                      //     errorText: "",
                                      //     errorStyle: TextStyle(height: 0),
                                      //       hintText: "Location",
                                      //       hintStyle: TextStyle(
                                      //           color: GRAY_CLR,
                                      //           fontSize: 14,
                                      //           fontWeight: FontWeight.normal),
                                      //       prefixIcon: Icon(
                                      //         Icons.location_on,
                                      //         color: GREEN_CLR,
                                      //         size: 20,
                                      //       ),
            
                                      //       suffixIcon:Icon(Icons.gps_fixed_sharp,size: 17,color: GRAY_CLR,) ,
                                      //       border: InputBorder.none)),
                                    
                                      ),
                                       


        ],),
      ));}
}