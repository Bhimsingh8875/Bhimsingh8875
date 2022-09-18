import 'package:flutter/material.dart';

import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/HOME/ServicesList.dart';
import 'package:pet_app/SevicesListAll_Screens/Add_Vaccinations.dart';
import 'package:pet_app/UTILS/Utils.dart';

import '../Componants/Images&Icons.dart';

class DetailModel{
  final String name;

  DetailModel(this.name);
}



class Reminder extends StatefulWidget {
  const Reminder({super.key});

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {

  static   List<String> TextName =['MedicatGives','MedicatGive medicine to fluffy and take him for the \n vaccinationions','Vaccinations'];
    final List<DetailModel> CheckReminder = List.generate(
        TextName.length,
            (index)
        => DetailModel('${TextName[index]}'));


String Select ='MedicatGives';
bool tap = false;
  var h;
  var w;
  @override
  Widget build(BuildContext context) {

  h = MediaQuery.of(context).size.height;
  w  = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: WHITE70_CLR,
      appBar: DefaultAppBar(REMINDERS),

       floatingActionButton: FloatingActionButton(
        backgroundColor: WHITE70_CLR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50)),side: BorderSide(color: GREEN_CLR)),
        onPressed: (){
       _AddReminder(context);
        },child: Icon(Icons.add,size: 40,color: GREEN_CLR,),heroTag: "b1",),

      body: Padding(
        padding:  EdgeInsets.only(left: w*0.030,top: h*0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            styleText(PINNED, DARK_CLR, FontWeight.bold, 19),
            SizedBox(height: h*0.010,),
            SizedBox(
              height: h*0.18,
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {  
                return Padding(
                  padding: const EdgeInsets.only(right: 5,bottom: 5),
                  child: Container(
                       
                    width: w*0.5,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    color:Colors.white,
                    boxShadow: [
                      BoxShadow(color: DROP_CLR.withOpacity(0.1),blurRadius: 10)
                    ]),
                    child: Padding(
                      padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
  Align(
    alignment: Alignment.topRight,
    child: styleText("10:00 AM", GRAY_CLR, FontWeight.normal, 10)),
                        styleText(MEDICINES, BLACK_CLR, FontWeight.bold, 16),
              
                        SizedBox(height: h*0.010,),
              
                         
                                      styleText(GIVE_MEDICINE_TITLE, GRAY_CLR, FontWeight.bold, 10),
                                    
                                  SizedBox(height: h*0.010,),

                                  Row(
                                    children: [
                                       GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            tap=true;
                                          });
                                        },
                                         child:
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        alignment: Alignment.center,
                                        height: h*0.035,
                                        width: w*0.2,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                        color: FADE_GREEN_CLR
                                        ),
                                        child: Row(children: [
                                          SvgPicture.asset(UNPIN_ICON),
                                          SizedBox(width: w*0.010,),
                                          styleText("Unpin", WHITE70_CLR, FontWeight.normal, 12)
                                        ]),
                                      ),
                                       ),
                                       SizedBox(width: w*0.030,),
                                       GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            tap=false;
                                          });
                                        },
                                         child: Container(
                                                                       
                                                                          //  alignment: Alignment.center,
                                                                           height: h*0.035,
                                                                           width: w*0.2,
                                                                           decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                                           color:  GREEN_CLR
                                                                           ),
                                                                           child: Padding(
                                                                             padding: const EdgeInsets.only(left: 5),
                                                                             child: Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                             Icon(Icons.check,color: WHITE70_CLR,size: 18,),
                                                                               SizedBox(width: w*0.010,),
                                                                               styleText(DONE, WHITE70_CLR, FontWeight.normal, 12)
                                                                             ]),
                                                                           ),
                                                                         ),
                                       ),
                                    ],
                                  ),

                             
              
              
              
                    
                      ]      
                    ),
                  ),
                  ),
                );
                }
              ),
            ),




SizedBox(height: h*0.020,),

styleText(UPCOMMING, DARK_CLR, FontWeight.bold, 19),
            SizedBox(height: h*0.010,),
            SizedBox(
              height: h*0.5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {  
                return Padding(
                      padding:  EdgeInsets.only(right: w*0.030,top: h*0.005,bottom: h*0.015),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        Select = TextName.elementAt(index).toString();
                      });
                    },
                    child: Container(
                                 
                      width: w*0.5,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      color:TextName.elementAt(index)==Select?FADE_BLUE_CLR.withOpacity(0.12):WHITE_CLR,
                      boxShadow: [
                        BoxShadow(color: DROP_CLR.withOpacity(0.1),blurRadius: 10)
                      ]),
                      child: Padding(
                        padding:  EdgeInsets.only(left: w*0.030,right: w*0.030,top: h*0.015,bottom: h*0.010),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                   
                          styleText(MEDICINES, BLACK_CLR, FontWeight.bold, 16),
                                
                          SizedBox(height: h*0.010,),
                                
                           
                                        styleText(CheckReminder[index].name, GRAY_CLR, FontWeight.bold, 10),
                                      
                                    SizedBox(height: h*0.010,),
                  
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      
                                        Row(
                  
                                          children: [
                                             GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  tap=true;
                                                });
                                              },
                                               child:
                                            Container(
                                              padding: EdgeInsets.only(left: 10),
                                              alignment: Alignment.center,
                                              height: h*0.035,
                                              width: w*0.2,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                              color: FADE_GREEN_CLR
                                              ),
                                              child: Row(children: [
                                                SvgPicture.asset(UNPIN_ICON),
                                                SizedBox(width: w*0.010,),
                                                styleText(UNPIN, WHITE70_CLR, FontWeight.normal, 12)
                                              ]),
                                            ),
                                             ),
                                             SizedBox(width: w*0.030,),
                                             GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  tap=false;
                                                });
                                              },
                                               child: Container(
                                                                             
                                                                                 alignment: Alignment.center,
                                                                                 height: h*0.035,
                                                                                 width: w*0.2,
                                                                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                                                 color:  GREEN_CLR
                                                                                 ),
                                                                                 child: Padding(
                                                                                   padding: const EdgeInsets.only(left: 5),
                                                                                   child: Row(children: [
                                                                                   Icon(Icons.check,color: WHITE70_CLR,size: 18,),
                                                                                     SizedBox(width: w*0.010,),
                                                                                     styleText(DONE, WHITE70_CLR, FontWeight.normal, 12)
                                                                                   ]),
                                                                                 ),
                                                                               ),
                                             ),
                                          ],
                                        ),
                  
                                         Align(
                      alignment: Alignment.topRight,
                      child: styleText("10:00 AM", GRAY_CLR, FontWeight.normal, 10)),
                                      ],
                                    ),
                  
                               
                                
                                
                                
                      
                        ]      
                      ),
                    ),
                    ),
                  )
                );
                }
              ),
            ),





          ],
        ),
      ),
    );
  }
}





Future<void> _AddReminder(BuildContext context) {
var h;
var w;


    String day = 'Medicine';
  final SelectDay = ['Medicine', 'Cat', 'Dog', 'rabbit', ];


h= MediaQuery.of(context).size.height;
w= MediaQuery.of(context).size.width;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Center(
              child: styleText(ADD_REMINDER, BLACK_CLR, FontWeight.bold, 17),
            ),
            content: Container(
              height: h*0.2,
              width: w*0.32,
              child: Column(
                children: [


 
          Container(
                                height: h*0.055,
                                width: w*0.55,
                            
                            decoration: BoxDecoration(
                              color: WHITE_CLR,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: BORDER_CLR,width: 1)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                 underline: SizedBox() ,
                                value: day,
                                onChanged: (String? newValue) {
                                  () => day = newValue!;
                                },
                                    
                                items: SelectDay
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                        DropdownMenuItem<String>(
                                        
     
                                          value: value,
                                          child: Text(value,style: TextStyle(color: GRAY_CLR,fontSize: 14),),
                                        ))
                                    .toList(),
     
                               
                                icon: Icon(Icons.keyboard_arrow_down,color: GRAY_CLR.withOpacity(0.5),size: 25,),
                                iconSize: 25,
                               
     
                              ),
                            ),
                          ),


                  SizedBox(height: h*0.025,),

                  DefaultButton(text: ADD, ontap: (){
                    Navigator.of(context).pop(false);
                  }, fontsize: 17, height: h*0.055, width: w*0.55),

                  SizedBox(height: 20,),

                  GestureDetector(
                    onTap: ()=>Navigator.of(context).pop(),
                    child: styleText(CANCEL, GREEN_CLR, FontWeight.normal, 17)),
                 
                      ],
                    ),
                  ),
                
              
            
          ),
        );
      });
}

