

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/utils/utils.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class SignUpController with ChangeNotifier{

FirebaseAuth  _auth = FirebaseAuth.instance;

DatabaseReference ref= FirebaseDatabase.instance.ref().child('User');

  bool _loading= false;
  bool get loading => _loading;

  setloading(bool value){
    _loading = value;
    notifyListeners();
  }


  //signupscreen

  void signupScreen(BuildContext context,String username,String email,String password)async{
    setloading(true);
    try{
       _auth.createUserWithEmailAndPassword(
          email: email,
          password: password).
       then((value) {
         SessionController().userid = value.user!.uid.toString();
           ref.child(value.user!.uid.toString()).set({
           'uid': value.user!.uid.toString(),
           'email': value.user!.email.toString(),
           'onlineStutas': 'noOne',
           'phone':" ",
           'username':username,
           'profile':" ",
         }).then((value) {
           setloading(false);
           Navigator.pushNamed(context, RouteName.dashboardScreen);
         }).onError((error, stackTrace) {
           setloading(false);
         });
         Utils.toatmessege('User account create succesfully');
         setloading(false);
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
