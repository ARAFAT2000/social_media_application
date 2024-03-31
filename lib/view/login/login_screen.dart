
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_application/res/component/input_text_field.dart';
import 'package:social_media_application/res/component/round_button.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view/signup/sign_up_screen.dart';
import 'package:social_media_application/view_model/login/log_in_controller.dart';
import 'package:social_media_application/view_model/services/splass_services.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode= FocusNode();
  final passwordFocusNode= FocusNode();

  final _key= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01,),
               Text('Chat App',style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: height * 0.01,),
                Text('Enter your email address\nto connect your app',
                    style: Theme.of(context).textTheme.displaySmall,textAlign: TextAlign.center,),
                SizedBox(height: height * 0.01,),
              Form(
                key: _key,
                  child: Padding(
                    padding:  EdgeInsets.only(top: height * 0.06,bottom:height * 0.001 ),
                    child: Column(

                      children: [
                        InputTextField(
                            myController: emailController,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email',
                            onfieldSubmitedValue: (value){

                            },
                            onValidator: (value){
                              return value.isEmpty ? 'Enter Email': null;
                            },
                            obscureText: false
                        ),
                        InputTextField(
                            myController: passwordController,
                            focusNode: passwordFocusNode,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Password',
                            onfieldSubmitedValue: (value){

                            },
                            onValidator: (value){
                              return value.isEmpty ? 'Enter Password': null;
                            },
                            obscureText: false
                        ),
                      ],
                    ),
                  )),
              Align(
                 alignment: Alignment.centerRight,
                 child:  GestureDetector(
                   onTap: (){
                     Navigator.pushNamed(context, RouteName.forgotpassword);
                   },
                   child: Text(
                        'Forgot Password',
                        style:TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline
                        )
                    ),
                 ),
               ),
                SizedBox(height: height * 0.03,),

                ChangeNotifierProvider(
                    create: (_)=> LogIncontroller(),
                   child:  Consumer<LogIncontroller>(
                       builder: (context,provider,child){
                         return RoundButton(
                             title: 'Log In',
                             loading: provider.loading,
                             onpress: (){
                             if(_key.currentState!.validate()){
                               provider.login(
                                   context,
                                   emailController.text,
                                   passwordController.text
                               );
                             }
                             });
                       }),
                ),
                SizedBox(height: height * 0.03,),

               InkWell(
                 onTap: (){
                  Navigator.pushNamed(context, RouteName.signupScreen);
                 },
                 child:  Text.rich(
                      TextSpan(
                        text:"Don't have an account ? ",
                          style:TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300
                          ),
                 
                        children: [
                          TextSpan(
                            text: 'Sign Up',
                            style:TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                                decoration: TextDecoration.underline
                            )
                          )
                        ]
                      )),
               )
              ],
            ),
          ),
        ),
      ),
    );
  }




  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
