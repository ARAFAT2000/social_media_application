

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_application/res/component/input_text_field.dart';
import 'package:social_media_application/res/component/round_button.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/view_model/forgot_password_controller/forgot_password_controller.dart';
import 'package:social_media_application/view_model/login/log_in_controller.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode= FocusNode();
  final passwordFocusNode= FocusNode();

  final _key= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        elevation: 5,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.01,),
                Text('Forgot Password',style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: height * 0.01,),
                Text('Enter your email address\nrecover your password',
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

                        ],
                      ),
                    )),

                SizedBox(height: height * 0.03,),

                ChangeNotifierProvider(
                  create: (_)=> ForgotPasswordcontroller(),
                  child:  Consumer<ForgotPasswordcontroller>(
                      builder: (context,provider,child){
                        return RoundButton(
                            title: 'Password Recover',
                            loading: provider.loading,
                            onpress: (){
                              if(_key.currentState!.validate()){
                                provider.forgotpassword(
                                    context,
                                    emailController.text,

                                );
                              }
                            });
                      }),
                ),
                SizedBox(height: height * 0.03,),

              
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
