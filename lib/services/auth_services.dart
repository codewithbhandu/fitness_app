import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthServices {
 

  final FirebaseAuth _firebase = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> registerAccount(String email,String password,String name,String phone) async{
   
  

    try{

      log("Inside try blok");
      final result = await _firebase.createUserWithEmailAndPassword(email: email, password: password);

      log("Result from the firebase${result.user}");
      if(result.user!=null){


        _firebaseFirestore
        .collection("users")
        .doc(result.user!.uid)
        .set(
          {
            'uid': result.user!.uid,
          
          
          'email': email,
          'name': name,
          'phone':phone

          },
        );

        log("result not null");
        return true;



        



      }
      else{
        log("result null");
        return false;
      }
    }

    catch(e){
      log("exception: $e");
      return false;
      
    }
  }


  Future<bool> loginRequest(String email, String password)async{
    try{
      print("inside try bloc of the login request");
      print("email::: $email,   password::: $password");
      final result = await _firebase.signInWithEmailAndPassword(email: email, password: password);
      print("inside try bloc of the login request: ${result.user!}");
      if(result.user!=null){
        print("result not null");
        return true;

      }
      else{
        print("result null");
        return false;
      }
    }
    catch(e){
      print("exception: $e");
      return false;
    }

  }


}