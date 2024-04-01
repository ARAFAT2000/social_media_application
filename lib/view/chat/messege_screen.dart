

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/res/colors.dart';
import 'package:social_media_application/utils/utils.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class MessegeScreen extends StatefulWidget {
  String image,name,email,reiceverId;
   MessegeScreen({super.key,required this.image,required this.name,required this.email,required this.reiceverId});

  @override
  State<MessegeScreen> createState() => _MessegeScreenState();
}

class _MessegeScreenState extends State<MessegeScreen> {

  final DatabaseReference ref = FirebaseDatabase.instance.ref().child('Chat');

  final messegesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text(widget.name.toString()),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Expanded(
                 child: ListView.builder(
                   itemCount: 30,
                     itemBuilder: (context,index){
                       return Text(index.toString());
                     })),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 05),
              child: Row(
                children: [
                Expanded(child:  Padding(
                  padding: const EdgeInsets.only(bottom: 20,left: 10,right: 20),
                  child: TextFormField(
                    controller: messegesController,
                    decoration: InputDecoration(
                      hintText: 'Enter messege',
                      suffixIcon: InkWell(
                        onTap: (){
                          sendMessege();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: Icon(Icons.send,
                            color:Colors.white ,
                            ),
                          ),
                        ),
                      ),
                      contentPadding:const EdgeInsets.all(15),
                      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 0,color: AppColors.primaryTextTextColor),
                      border:const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: AppColors.textFieldDefaultFocus),
                      ),
                      focusedBorder:const  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: AppColors.secondaryColor),
                      ),
                      errorBorder:const  OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: AppColors.alertColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
                      ),
                    ),
                  ),
                )
                ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  sendMessege(){
    if(messegesController.text.isEmpty){
    Utils.toatmessege('enter messege');
    }
final timeStapm= DateTime.now().millisecond.toString();
    ref.child(timeStapm).set({
      'isSeen':false,
      'messege': messegesController.text.toString(),
      'sender':SessionController().userid.toString(),
      'reicever':widget.reiceverId,
      'time' : timeStapm.toString()
    }).then((value) {
        messegesController.clear();
    }).onError((error, stackTrace) {

    });


  }

}
