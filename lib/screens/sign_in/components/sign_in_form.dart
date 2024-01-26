import 'package:case_study/components/default_button.dart';
import 'package:case_study/components/form_error.dart';
import 'package:case_study/components/toast.dart';
import 'package:case_study/constant.dart';
import 'package:case_study/models/user_signin_request_model.dart';
import 'package:case_study/notifier/auth_notifier.dart';
import 'package:case_study/services/auth_service.dart';
import 'package:case_study/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> with Toast {
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool isPasswordVisible = false;
  List<String?> errors = [];
  AuthService authService = AuthService();
  User user = User(email: '', password: '');
  ProviderContainer container = ProviderContainer();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  void removeAllError() {
    setState(() {
      errors = [];
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                // onTap: () => Navigator.pushNamed( context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          Consumer(builder:(context,ref,_){
            bool isLoading =ref.watch(authNotifierProvider);
            return isLoading? const CircularProgressIndicator():
                    DefaultButton(
            text: "Continue",
            press: () {
              removeAllError();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // userSignInRequestModel.email='fatmanur13.fe@gmail.com';
                ref.read(authNotifierProvider.notifier).login(email: user.email, password: user.password, context: context);
                // if all are valid then go to success screen
                // KeyboardUtil.hideKeyboard(context);
              }
            },
          );
          })
  
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: !isPasswordVisible,
      onSaved: (newValue) => user.password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
            removeError(error: kPassNullError);

        } 
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
           addError(error: kPassNullError);

        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // labelStyle: TextStyle(color: kTextColor), // Change the color as needed
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.tertiary,
            )),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => user.email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.mail,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
