import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/core/widgets/app_title_text.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding:  EdgeInsets.only(top: MediaQuery.sizeOf(context).height/3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: FilledButton(onPressed: ()=>context.goNamed('LoginPage'), child:const AppTitleText(TextConstants.login, color: Colors.white,)),
              ),
              Padding(
                padding: const EdgeInsets.all(18),
                child: FilledButton(onPressed: ()=>context.goNamed('RegisterPage'), child:const AppTitleText(TextConstants.register, color: Colors.white,)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}