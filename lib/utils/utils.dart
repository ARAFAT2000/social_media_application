


import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_media_application/res/colors.dart';

class Utils{
  //work on focus
 static void fieldfocus(BuildContext context ,FocusNode curentNode,FocusNode nextFocus ){
    curentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //work on toast messege

static void toatmessege(String messege){
   Fluttertoast.showToast(msg: messege,
   backgroundColor: AppColors.primaryTextTextColor,
     textColor: AppColors.whiteColor,
     fontSize: 16
   );

}
}