import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/features/auth/bussiness/bloc/auth_cubit.dart';
import 'package:licence/features/auth/bussiness/bloc/auth_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "a");
  TextEditingController passwordController = TextEditingController(text: "a");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 4),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _EmailFieldWidget(emailController: emailController),
                const SizedBox(height: 20),

                _PasswordFieldWidget(passwordController: passwordController),
                const SizedBox(height: 30),

                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {

                    return FilledButton(
                      onPressed: () async{
                        final bool success = await context.read<AuthCubit>().login(emailController.text, passwordController.text);
                        if (success) context.goNamed('CustomerLicencesPage');
                        else debugPrint("giriş başarısız");      
                      },
                      child: const Text(
                        TextConstants.login,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: TextConstants.loginPagePassword,
        hintText: TextConstants.loginPageEnterYourPassword,
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      obscureText: true,
    );
  }
}

class _EmailFieldWidget extends StatelessWidget {
  const _EmailFieldWidget({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: TextConstants.loginPageEmail,
        hintText: TextConstants.loginPageEnterYourEmail,
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
