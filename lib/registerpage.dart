import 'package:fitness_app/logic/registerbloc/register_bloc.dart';
import 'package:fitness_app/loginpage.dart';

import 'package:fitness_app/services/auth_services.dart';
import 'package:fitness_app/utilis/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  bool _obscureText = true;
  final AuthServices _register = AuthServices();

  void registerUser(
    String email,
    String password,
    String name,
    String phone,
  ) async {
    final result = await _register.registerAccount(
      email,
      password,
      name,
      phone,
    );

    if (result) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Account created successfully! Please login.")),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Register Unsuccessfully")));
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset("assets/paailaa.png")),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text(
                'Create your account',
                style: TextStyle(
                  fontFamily: "Roboto Flex",
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text('Full Name', style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: _nameController,

                decoration: InputDecoration(
                  hintText: 'enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
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
              child: Text('Number', style: TextStyle(color: Colors.grey)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextField(
                controller: _contactController,
                keyboardType: TextInputType.numberWithOptions(),

                decoration: InputDecoration(
                  hintText: 'enter your number',
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

            SizedBox(height: 20),

            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if(state is RegisterSuccessful){
                  Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Loginpage()),
      );
                }
                if (state is RegisterFailure){

                }

             
              },
              builder: (context, state) {
                print(state.toString());
                if(state is RegisterLoading){
                  return CircularProgressIndicator();
                }
             
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),

                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: primarycolor,

                    onPressed: () {


                          context.read<RegisterBloc>().add(RegisterRequestedEvent(email: _emailController.text.trim(),password: _passwordController.text.trim(),name: _nameController.text.trim(),phone: _contactController.text.trim()));
                     
                    
                    },

                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
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
                SizedBox(width: 50),
                Text(
                  'Already have an account?',
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
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  },

                  child: Text(
                    'Sign in',
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
