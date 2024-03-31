import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:social_media_application/firebase_options.dart';
import 'package:social_media_application/res/colors.dart';
import 'package:social_media_application/utils/routes.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view/login/login_screen.dart';
import 'package:social_media_application/view/signup/sign_up_screen.dart';
import 'package:social_media_application/view/splass/splass_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: TextStyle(color: AppColors.primaryTextTextColor,fontSize: 22),),

        textTheme: const TextTheme(
         // headline1: == display
          displayLarge : TextStyle(color: AppColors.primaryTextTextColor,fontSize: 17,fontWeight: FontWeight.w500,height: 1.6),
          displayMedium:TextStyle(color: AppColors.primaryTextTextColor,fontSize: 32,fontWeight: FontWeight.w500,height: 1.4),
          displaySmall: TextStyle(color: AppColors.primaryTextTextColor,fontSize: 15,fontWeight: FontWeight.w500,height: 1.9),
          headlineMedium:TextStyle(color: AppColors.primaryTextTextColor,fontSize: 24,fontWeight: FontWeight.w500,height: 1.9) ,
          headlineSmall: TextStyle(color: AppColors.primaryTextTextColor,fontSize: 20,fontWeight: FontWeight.w500,height: 1.9) ,
          headlineLarge: TextStyle(color: AppColors.primaryTextTextColor,fontSize: 17,fontWeight: FontWeight.w700,height: 1.9) ,

          bodyLarge : TextStyle(color: AppColors.primaryTextTextColor,fontSize: 17,fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(color: AppColors.primaryTextTextColor,fontSize: 14,fontWeight: FontWeight.w500),
         //caption==bodysmall
          bodySmall:  TextStyle(color: AppColors.primaryTextTextColor,fontSize: 12,fontWeight: FontWeight.w500),



        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const SplashScreen(),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}




