// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:fitness_app/fogetpasswordpage.dart';
import 'package:fitness_app/homepage.dart';
import 'package:fitness_app/logic/loginbloc/login_bloc.dart';
import 'package:fitness_app/registerpage.dart';
import 'package:fitness_app/services/auth_services.dart';
import 'package:fitness_app/utilis/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, BlocConsumer, ReadContext;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool _obscureText = true;
  final AuthServices _login = AuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(String email, String password) async {
    log("Inside login bloc");
    print("Inside login function after clicking on the login button");
    print("Email::::::$email,,,, password::::: $password");
    final result = await _login.loginRequest(email, password);
    if (result) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(" Login successfull.")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Unsuccessfully")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/paailaa.png")),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Login to your account',
                style: TextStyle(
                  fontFamily: "Roboto Flex",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text('Email', style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text('Password', style: TextStyle(color: Colors.grey)),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscureText,

                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),

                  hintText: 'enter your password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15),

            GestureDetector(
              onTap: () {
                // Navigate to Forgot Password page or show dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },

              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.blue,

                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),

            BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if(state is LoginSuccessful){

                   Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
                }
                if(state is LoginFailure){
                  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failure.")),
                  );
                  
                }
              },
              builder: (context, state) {
                print(state.toString());
                if(state is LoginLoading){
                  return CircularProgressIndicator();
                }
             
                return Container(


                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),

                  child: ElevatedButton(
                  

                    onPressed: () {
                      print(" Login button tapped");
                       context.read<LoginBloc>().add(LoginRequestedEvent(email: _emailController.text.trim(),password: _passwordController.text.trim()));
                     
                    },

                    child: Text('Login', style: TextStyle(color: Colors.black)),
                  ),
                );
              },
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'or',
                style: TextStyle(
                  fontFamily: 'Roboto Flex',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),

            Row(
              children: [
                SizedBox(width: 65),
                Text(
                  'New to Paailaa?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto Flex',
                  ),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registerpage()),
                    );
                  },

                  child: Text(
                    'Create account',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto Flex',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
