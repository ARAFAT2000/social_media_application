


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/utils/routes.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class SplassService{






  void isLoggedIn(BuildContext context){
    FirebaseAuth  _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;

    if(user !=null){

      SessionController().userid=user.uid.toString();

      Timer(Duration(seconds: 3), () =>
          Navigator.pushNamed(context, RouteName.loginScreen)
      );
    }else{
      Timer(Duration(seconds: 3), () =>
          Navigator.pushNamed(context, RouteName.loginScreen)
      );
    }



  }

}