

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/utils/utils.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class ForgotPasswordcontroller with ChangeNotifier{

  FirebaseAuth  _auth = FirebaseAuth.instance;

  bool _loading= false;
  bool get loading => _loading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

  void forgotpassword(BuildContext context,String email)async{
    setloading(true);
    try{
      _auth.sendPasswordResetEmail(
          email: email,
       ).
      then((value) {
        //
        setloading(false);
        Navigator.pushNamed(context, RouteName.loginScreen);
        Utils.toatmessege('Please check your email to recover your password');

      }).
      onError((error, stackTrace) {
        Utils.toatmessege(error.toString());
        setloading(false);
      });

    }catch(e){

      print(e.toString());
    }
  }

}