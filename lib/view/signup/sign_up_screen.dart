import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_application/res/component/input_text_field.dart';
import 'package:social_media_application/res/component/round_button.dart';
import 'package:social_media_application/utils/routes_name.dart';
import 'package:social_media_application/utils/utils.dart';
import 'package:social_media_application/view/signup/signup_controller.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userfocusNodeController= FocusNode();
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
          child:ChangeNotifierProvider(
            create: (_)=>SignUpController(),
            child: Consumer<SignUpController>(
                builder:(context,provider,child){
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01,),
                        Text('Chat App',style: Theme.of(context).textTheme.displayMedium),
                        SizedBox(height: height * 0.01,),
                        Text('Enter your email address\nto register your app',
                          style: Theme.of(context).textTheme.displaySmall,textAlign: TextAlign.center,),
                        SizedBox(height: height * 0.01,),
                        Form(
                            key: _key,
                            child: Padding(
                              padding:  EdgeInsets.only(top: height * 0.06,bottom:height * 0.001 ),
                              child: Column(

                                children: [
                                  InputTextField(
                                      myController: usernameController,
                                      focusNode: userfocusNodeController,
                                      keyboardType: TextInputType.emailAddress,
                                      hint: 'Username',
                                      onfieldSubmitedValue: (value){

                                      },
                                      onValidator: (value){
                                        return value.isEmpty ? 'Enter Name': null;
                                      },
                                      obscureText: false
                                  ),
                                  InputTextField(
                                      myController: emailController,
                                      focusNode: emailFocusNode,
                                      keyboardType: TextInputType.emailAddress,
                                      hint: 'Email',
                                      onfieldSubmitedValue: (value){
                                        Utils.fieldfocus(context, emailFocusNode, passwordFocusNode);
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
                                      obscureText: true
                                  ),
                                ],
                              ),
                            )),

                        SizedBox(height: height * 0.03,),
                        RoundButton(title: 'Sign Up',
                            loading: provider.loading,

                            onpress: (){
                          print('tapper');
                          if(_key.currentState!.validate()){
                            provider.signupScreen(context,
                                usernameController.text,
                                emailController.text,
                                passwordController.text);
                          }
                            }),
                        SizedBox(height: height * 0.03,),

                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, RouteName.loginScreen);
                          },
                          child: Text.rich(
                              TextSpan(
                                  text:"Already have an account ? ",
                                  style:TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300
                                  ),

                                  children: [
                                    TextSpan(
                                        text: 'Log In',
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
                  );
                }),
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


