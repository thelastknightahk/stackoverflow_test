import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart'; 
import 'package:go_router/go_router.dart';
import 'package:sof/core/global/constants/api_constant.dart';
import 'package:sof/data/model/bookmark_model.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    _goToHome(context);
    return   Scaffold(
      body: Center(
        child: Container( width: 120, height: 100, decoration: BoxDecoration(
       
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(image: AssetImage('assets/images/app_logo.png'), fit: BoxFit.cover)
        ), )
      ),
    );
  }

  Future<void> _goToHome(BuildContext context) async{
      Future.delayed(const Duration(milliseconds: 2000),(){
         context.go('/home');
      });
    
  }
}