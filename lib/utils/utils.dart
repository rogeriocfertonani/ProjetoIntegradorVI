import 'package:doar_app/screens/LoginUsuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


sairAplicacao(ctx){


    var auth = FirebaseAuth.instance;
    auth.signOut().then((value) =>
        Navigator.push(ctx,MaterialPageRoute(builder:(context)=>LoginUsuario()),)


    );
}