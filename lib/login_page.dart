// import 'dart:js';

import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formkey = GlobalKey<FormState>();

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(context, '/chat',
          arguments: '${userNameController.text}');
      print('login! successful!');
    } else {
      print('not successful');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final _mainUrl = "https://poojabhaumik.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5),
              ),
              Text(
                'Welcome back! \n You\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.blueGrey),
              ),
                verticalSpacing(24),
                 Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: 
                    BoxDecoration(    
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage('assets/illustration.png')),
                      borderRadius: BorderRadius.circular(24)),
              ),
                verticalSpacing(24),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Your username should be more than 5 characters";
                        } else if (value != null && value.isEmpty) {
                          return "Please type your username";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisks: true,
                      controller: passwordController,
                      hintText: 'Enter your password',
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: Text('Login',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w300)),
              ),
              GestureDetector(
                onTap: () async {
                  print('Link Clicked!');
                  final Uri url = Uri.parse(_mainUrl);
                  if (!await launchUrl(url)) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text(_mainUrl),
                  ],
                ),
              ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton.facebook(
                      size: 20,
                      color: Colors.blue,
                      url: "https://www.facebook.com/share/1BPmT72qMA/",
                    ),
                    SocialMediaButton.linkedin(
                      url:
                          "https://www.linkedin.com/in/alvic-caranzo-b724a4170/",
                    )
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
