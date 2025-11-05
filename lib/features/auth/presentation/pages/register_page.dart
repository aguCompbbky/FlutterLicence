import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:licence/core/constants/text_constants.dart';
import 'package:licence/core/widgets/app_title_text.dart';
import 'package:licence/features/auth/bussiness/bloc/auth_cubit.dart';
import 'package:licence/features/auth/bussiness/bloc/auth_state.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _surnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              _NameFieldWidget(nameController: _nameController),
              const SizedBox(height: 16),

              _SurnameFieldWidget(surnameController: _surnameController),
              const SizedBox(height: 16),

              _EmailFieldWidget(emailController: _emailController),
              const SizedBox(height: 16),

              _PasswordFieldWidget(passwordController: _passwordController),
              const SizedBox(height: 32),

              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return FilledButton(
                    onPressed: () => context.read<AuthCubit>().register(name: _nameController.text, surname: _surnameController.text, email: _emailController.text, password: _passwordController.text),
                    child: const AppTitleText(TextConstants.register, color: Colors.white),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PasswordFieldWidget extends StatelessWidget {
  const _PasswordFieldWidget({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(labelText: TextConstants.loginPagePassword),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        } else if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class _EmailFieldWidget extends StatelessWidget {
  const _EmailFieldWidget({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(labelText: TextConstants.loginPageEmail),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
    );
  }
}

class _SurnameFieldWidget extends StatelessWidget {
  const _SurnameFieldWidget({
    super.key,
    required TextEditingController surnameController,
  }) : _surnameController = surnameController;

  final TextEditingController _surnameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _surnameController,
      decoration: const InputDecoration(labelText: "Surname"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your surname';
        }
        return null;
      },
    );
  }
}

class _NameFieldWidget extends StatelessWidget {
  const _NameFieldWidget({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(labelText: "Name"),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}
