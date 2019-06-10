import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();
  String email='';
  String password=' ';
  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //now create helper methods to evaluate it
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 35.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  //three heper methods
  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType
          .emailAddress, //makes keyboard as per required to enter an email id so that user need not change to find @ button in keyboard
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator:validateEmail,
      onSaved: (String value) {
        print(value);
        email= value;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'password',
      ),
      validator: validatePassword,
      onSaved: (String value) //getting value form field
          {
        print(value);
        password=value;
      },
    );
  }

  Widget submitButton() {
    return RaisedButton(
      child: Text('Submit!'),
      color: Colors.blue,
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('Time to test $email and $password to my API');
        }
      },
    );
  }
}
