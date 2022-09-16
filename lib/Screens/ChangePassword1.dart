import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Screens/Login.dart';
import 'package:pet_app/UTILS/Utils.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';
class ChangePassword1 extends StatefulWidget {
  const ChangePassword1({super.key});

  @override
  State<ChangePassword1> createState() => _ChangePassword1State();
}

class _ChangePassword1State extends State<ChangePassword1> {

  final _formkey =GlobalKey<FormState>();

  TextEditingController _newPasswordCantrolller =TextEditingController();
  
  TextEditingController _creatPasswordCantrolller =TextEditingController();

  String passError  = "";
  String newPassError = "";

  bool _passwordVisible =false;
    bool _passwordVisible1 =false;
var h;
var w;


  @override
  Widget build(BuildContext context) {

    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: WHITE70_CLR,
    
 body: Form(
  key: _formkey,
   child: SingleChildScrollView(
     child: Container(
      padding: EdgeInsets.only(top: h*0.1,left: w*0.050,right: w*0.050),
      alignment: Alignment.center,
      height: h*1,
       child: Column(
        
        crossAxisAlignment: CrossAxisAlignment.center, 
        children: [

          
            GestureDetector(
               onTap: (){
                Navigator.of(context).pop();},
              child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
              height:40,width: 40,
              child: CircleAvatar(
              
                backgroundColor: FADE_GREEN_CLR,
                 child: Icon(Icons.arrow_back_ios_new,size: 22,color: WHITE70_CLR,),),
                    ),
                      ),
            ),
              SizedBox(
                height: h*0.25,
                width: w*0.8,
                child: SvgPicture.asset('assets/svg_image/Illustration.svg')),
    
    
                SizedBox(
                  height: h*0.040,
                ),
    
             styleText("Change Password", BLACK_CLR, FontWeight.bold, 19),

                  Container(
                                height: h*0.06,
                                margin: EdgeInsets.only(top: h * 0.025),
                                decoration: BoxDecoration(
                                  color: WHITE70_CLR,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: SHADOW_CLR.withOpacity(0.1),blurRadius: 14)
                                    ]
                                    ),
                                // color: WHITE_CLR,
                                
                                child: TextFormField(
                                  controller: _creatPasswordCantrolller,
                                  validator: (value){
                                    if(value!.isEmpty){

                                      newPassError ="Please enter old password";
                                      setState(() {
                                        
                                      });
                                      return "";
                                    }
                                    else{
                                      newPassError="";
                                    }
                                  },
                                  //  validator: (value){
                                  //   formProvider.validPassword(value);
                                  //  },
                                 
                                
                                  obscureText: _passwordVisible1,
                                  textCapitalization: TextCapitalization.none,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    errorText: "",
                                    errorStyle: TextStyle(height: 0),
                                      hintText: "Old Password",
                                      hintStyle: TextStyle(
                                          color: GRAY_CLR,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: GRAY_CLR,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _passwordVisible1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: GRAY_CLR),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible1 = !_passwordVisible1;
                                          });
                                        },
                                      )),
                                ),
                              ),
    
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Visibility(
                                      visible: newPassError!="",
                                      child: Text(newPassError,style: TextStyle(color: Colors.red,fontSize: 12),textAlign: TextAlign.start,)),
                                  ),
   
                                
    
            Container(
                                height: h*0.06,
                                margin: EdgeInsets.only(top: h * 0.025),
                                decoration: BoxDecoration(
                                  color: WHITE70_CLR,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: SHADOW_CLR.withOpacity(0.1),blurRadius: 14)
                                    ]
                                    ),
                                // color: WHITE_CLR,
                                
                                child: TextFormField(
                                  controller: _newPasswordCantrolller,
                                  validator: (value){
                                    if(value!.isEmpty){

                                      passError ="Please enter new  password";
                                      setState(() {
                                        
                                      });
                                      return "";
                                    }
                                    else{
                                      passError="";
                                    }
                                  },
                                 
                                 
                                
                                  obscureText: _passwordVisible,
                                  textCapitalization: TextCapitalization.none,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    errorText: "",
                                    errorStyle: TextStyle(height: 0),
                                      hintText: "New Password",
                                      hintStyle: TextStyle(
                                          color: GRAY_CLR,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: GRAY_CLR,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _passwordVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: GRAY_CLR),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible = !_passwordVisible;
                                          });
                                        },
                                      )),
                                ),
                              ),
    
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Visibility(
                                      visible: passError!="",
                                      child: Text(passError,style: TextStyle(color: Colors.red,fontSize: 12),textAlign: TextAlign.start,)),
                                  ),



                                   Container(
                                height: h*0.06,
                                margin: EdgeInsets.only(top: h * 0.025),
                                decoration: BoxDecoration(
                                  color: WHITE70_CLR,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(color: SHADOW_CLR.withOpacity(0.1),blurRadius: 14)
                                    ]
                                    ),
                                // color: WHITE_CLR,
                                
                                child: TextFormField(
                                  controller: _creatPasswordCantrolller,
                                  validator: (value){
                                    if(value!.isEmpty){

                                      newPassError ="Please enter confirm password";
                                      setState(() {
                                        
                                      });
                                      return "";
                                    }
                                    else{
                                      newPassError="";
                                    }
                                  },
                                  //  validator: (value){
                                  //   formProvider.validPassword(value);
                                  //  },
                                 
                                
                                  obscureText: _passwordVisible1,
                                  textCapitalization: TextCapitalization.none,
                                  textAlign: TextAlign.start,
                                  decoration: InputDecoration(
                                    errorText: "",
                                    errorStyle: TextStyle(height: 0),
                                      hintText: "Confirm Password",
                                      hintStyle: TextStyle(
                                          color: GRAY_CLR,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                      prefixIcon: Icon(
                                        Icons.lock_open_outlined,
                                        color: GRAY_CLR,
                                        size: 20,
                                      ),
                                      border: InputBorder.none,
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                            _passwordVisible1
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: GRAY_CLR),
                                        onPressed: () {
                                          setState(() {
                                            _passwordVisible1 = !_passwordVisible1;
                                          });
                                        },
                                      )),
                                ),
                              ),
    
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Visibility(
                                      visible: newPassError!="",
                                      child: Text(newPassError,style: TextStyle(color: Colors.red,fontSize: 12),textAlign: TextAlign.start,)),
                                  ),
   
                                  SizedBox(
                                    height: h*0.040,
                                  ),


   
                                  DefaultButton(text: "Submit", ontap: (){
                                    if(_formkey.currentState!.validate()){
                                      passError = "";
                                      newPassError ="";

                                      Navigate_to(context, Login());
   
                                    }
                                  }, fontsize: 18, height: h*0.060, width: w*1),
   
   
   
   
                                 
    
       ]),
     ),
   ),
 ),
    );
  }
}