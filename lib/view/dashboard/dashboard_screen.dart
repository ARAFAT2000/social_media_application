
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:social_media_application/res/colors.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view/user/user_list_screen.dart';
import 'package:social_media_application/view_model/services/session_manager.dart';


class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
//widget list k index onujay controll krbe
  final controller= PersistentTabController(initialIndex: 0);

  //widget list
  List<Widget> _buildScreens()
  {
    return [
      Text('Home'),
      Text('Chat'),
      Text('Add'),
      UserListScreen(),
      Text('Profile'),
      
    ];
  }

  List<PersistentBottomNavBarItem>_naveBaritem(){
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        inactiveIcon:Icon(Icons.home,color: Colors.grey,),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        title: ("Chat"),
        inactiveIcon:Icon(Icons.chat,color: Colors.grey,),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.add),
        title: ("Add"),
        inactiveIcon:Icon(Icons.add,color: Colors.grey,),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ("Messege"),
        inactiveIcon:Icon(Icons.message,color: Colors.grey,),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        inactiveIcon:Icon(Icons.person,color: Colors.grey,),
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
        context,
        screens: _buildScreens(),
        items: _naveBaritem(),
      backgroundColor: AppColors.dialogAlertBackgroundColor,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(1),
      ),
       navBarStyle: NavBarStyle.style1,
    );
  }
}
