import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/res/colors.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String url = 'https://www.mnp.ca/-/media/foundation/integrations/personnel/2020/12/16/13/57/personnel-image-4483.jpg?h=800&w=600&hash=9D5E5FCBEE00EB562DCD8AC8FDA8433D';


 final ref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: StreamBuilder(
            stream: ref.child(SessionController().userid.toString()).onValue,
            builder: (context,AsyncSnapshot<dynamic> snapshot){
              if (snapshot.hasData) {
                // Map<dynamic,dynamic> map =
                //     snapshot.data.snapshot.value;
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                          height: 130,
                          width: 130,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.secondaryColor,
                                  width: 5
                              )
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child:Image(
                              fit: BoxFit.cover,
                              image:NetworkImage(url),
                              loadingBuilder:(BuildContext context, Widget child,  loadingProgress) {
                                if(loadingProgress == null) return child;
                                return Center(child: CircularProgressIndicator(),);
                              },
                              errorBuilder: (BuildContext, Object, StackTrace){
                                return Container(
                                  child: Icon(Icons.error,color: AppColors.alertColor,),
                                );
                              },
                            ),


                          )
                      ),
                    ),
                    // ListTile(
                    //     title: Text(snapshot.data[index].toString()
                    //     )
                    // )
                  ],
                );
              }
              else if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text('networkproblem'),
                );
              }else if (snapshot.hasError) {
                return Center(
                  child: Text('Something went hasError'),
                );
              } else if (snapshot.error is FirebaseException) {
                FirebaseException firebaseError = snapshot.error as FirebaseException;
                print('Firebase error: ${firebaseError.message}');
                return Center(child: Text('Firebase error: ${firebaseError.message}'),);
              }
              else if (snapshot.hasData && snapshot.data.snapshot.value != null) {
               return Text('Firebase problem');
              } else {
                //'Map<String, dynamic>' a thakle error dekhabe

                print('Unknown error: ${snapshot.error}');
                return Center(child: Text('An unknown error occurred: ${snapshot.error}'),);
              }



            }),
      ),
    );
  }
}
