import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_application/view/chat/messege_screen.dart';


class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {

  DatabaseReference ref= FirebaseDatabase.instance.ref().child('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('User List'),
        elevation: 10,
      ),
      body: SafeArea(
        child: FirebaseAnimatedList(
            query: ref,
            itemBuilder:(context,snapshot,animation,index){
              return Card(
                elevation: 0,
                child: ListTile(
                  onTap: (){
                    PersistentNavBarNavigator.pushNewScreen(context,
                        screen: MessegeScreen(
                          image:'',
                          email: snapshot.child('email').value.toString(),
                          name: snapshot.child('username').value.toString(),
                          reiceverId: snapshot.child('uid').value.toString(),
                        ),
                    withNavBar: false
                    );

                  },
                  //profile picture akhne upload krte hbe
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Icon(Icons.person),
                  ),
                  title: Text(snapshot.child('username').value.toString()),
                  subtitle: Text(snapshot.child('email').value.toString()),
                ),

              );

            }
        ),
      ),
    );
  }
}
