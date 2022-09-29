import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_app/Colors/COLORS.dart';
import 'package:pet_app/Componants/Images&Icons.dart';
import 'package:pet_app/UTILS/Utils.dart';
import '../Api/ChangePasswordApi.dart';
import '../Prefrence.dart';

class ChangePassword1 extends StatefulWidget {
  const ChangePassword1({super.key});

  @override
  State<ChangePassword1> createState() => _ChangePassword1State();
}

class _ChangePassword1State extends State<ChangePassword1> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController _oldPasswordCantroller = TextEditingController();
  TextEditingController _newPasswordCantrolller = TextEditingController();
  TextEditingController _confirmPasswordCantrolller = TextEditingController();

  String passError = "";
  String newPassError = "";
  String ConfirmPassError = "";

  bool _passwordVisible = false;
  bool _passwordVisible1 = false;
  bool _passwordVisible2 = false;
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
            alignment: Alignment.center,
            height: h * 1,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.1, left: w * 0.035),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: CircleAvatar(
                            backgroundColor: FADE_GREEN_CLR,
                            child: Icon(
                              Icons.arrow_back_ios_new,
                              size: 22,
                              color: WHITE70_CLR,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: h * 0.060, left: w * 0.075, right: w * 0.075),
                    child: Column(children: [
                      SizedBox(
                          height: h * 0.25,
                          width: w * 0.8,
                          child: SvgPicture.asset(CHANGE_PASS_IMAGE)),
                      SizedBox(
                        height: h * 0.040,
                      ),
                      styleText(
                          CHANGE_PASSWORD, BLACK_CLR, FontWeight.bold, 19),
                      Container(
                        height: h * 0.06,
                        margin: EdgeInsets.only(top: h * 0.025),
                        decoration: BoxDecoration(
                            color: WHITE70_CLR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: SHADOW_CLR.withOpacity(0.1),
                                  blurRadius: 14)
                            ]),
                        // color: WHITE_CLR,

                        child: TextFormField(
                          controller: _oldPasswordCantroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              newPassError = ENTER_OLD_PASS;
                              setState(() {});
                              return "";
                            } else {
                              newPassError = "";
                            }
                          },
                          obscureText: _passwordVisible,
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
                            visible: newPassError != "",
                            child: Text(
                              newPassError,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Container(
                        height: h * 0.06,
                        margin: EdgeInsets.only(top: h * 0.025),
                        decoration: BoxDecoration(
                            color: WHITE70_CLR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: SHADOW_CLR.withOpacity(0.1),
                                  blurRadius: 14)
                            ]),
                        // color: WHITE_CLR,

                        child: TextFormField(
                          controller: _newPasswordCantrolller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              passError = ENTER_NEW_PASS;
                              setState(() {});
                              return "";
                            } else {
                              passError = "";
                            }
                          },
                          obscureText: _passwordVisible1,
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
                            visible: passError != "",
                            child: Text(
                              passError,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      Container(
                        height: h * 0.06,
                        margin: EdgeInsets.only(top: h * 0.025),
                        decoration: BoxDecoration(
                            color: WHITE70_CLR,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: SHADOW_CLR.withOpacity(0.1),
                                  blurRadius: 14)
                            ]),
                        // color: WHITE_CLR,

                        child: TextFormField(
                          controller: _confirmPasswordCantrolller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              ConfirmPassError = ENTER_CONFIRM_PASS;
                              setState(() {});
                              return "";
                            } else if (_confirmPasswordCantrolller !=
                                _newPasswordCantrolller) {
                              ConfirmPassError =
                                  ENTER_CONFIRM_PASS_DOES_NOT_MATCH;
                            } else {
                              ConfirmPassError = "";
                            }
                          },
                          obscureText: _passwordVisible2,
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
                                    _passwordVisible2
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: GRAY_CLR),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible2 = !_passwordVisible2;
                                  });
                                },
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Visibility(
                            visible: ConfirmPassError != "",
                            child: Text(
                              ConfirmPassError,
                              style: TextStyle(color: Colors.red, fontSize: 12),
                              textAlign: TextAlign.start,
                            )),
                      ),
                      SizedBox(
                        height: h * 0.040,
                      ),
                      DefaultButton(
                          text: SUBMIT,
                          ontap: () {
                            if (_formkey.currentState!.validate()) {
                              passError = "";
                              newPassError = "";

                              ChangePasswordApi(
                                      _oldPasswordCantroller.text.toString(),
                                      _confirmPasswordCantrolller.text
                                          .toString())
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: GREEN_CLR,
                                        content: Text(
                                            changepasswordmsg.toString())));
                              }).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: GREEN_CLR,
                                        content: Text(e.toString())));
                              });
                            }
                          },
                          fontsize: 18,
                          height: h * 0.060,
                          width: w * 1),
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
