import 'package:fitness_app/loginpage.dart';
import 'package:fitness_app/utilis/colors.dart';
import 'package:flutter/material.dart';

class Onboardscreen extends StatefulWidget {
  const Onboardscreen({super.key});

  @override
  State<Onboardscreen> createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<Onboardscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 30,),
          
          Center(child: Image.asset("assets/paailaa.png",)),
          Center(child: Image.asset("assets/fitness.png",)),
          SizedBox(height: 20,),
          Text("Track Your Fitness Progress."),
          SizedBox(height: 40,),
         Container(
      
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20),
          
          
           child: MaterialButton(  
          shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
            color: primarycolor,
          
            onPressed: (){
              Navigator.push(context,
             MaterialPageRoute(builder: (context)=> Loginpage()));
              
                 
            },
            
            
                   
             
             child: Text('Login/Signup.', style: TextStyle(color: Colors.white),)),
         )
      
      
        ],
      
      
      ) 





    );
  }
}