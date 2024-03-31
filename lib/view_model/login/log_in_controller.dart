

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/utils/utils.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class LogIncontroller with ChangeNotifier{

  FirebaseAuth  _auth = FirebaseAuth.instance;

  bool _loading= false;
  bool get loading => _loading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(BuildContext context,String email,String password)async{
    setloading(true);
    try{
      _auth.signInWithEmailAndPassword(
          email: email,
          password: password).
      then((value) {
        //
        SessionController().userid = value.user!.uid.toString();

        setloading(false);
        Navigator.pushNamed(context, RouteName.dashboardScreen);

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