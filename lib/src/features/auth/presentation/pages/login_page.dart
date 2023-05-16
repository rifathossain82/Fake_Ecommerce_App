import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/auth/presentation/widgets/create_a_new_account_text_button.dart';
import 'package:fake_ecommerce_app/src/features/auth/presentation/widgets/forgot_password_text_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool passwordVisibility = true;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: _loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: context.screenHeight * 0.05),
                  const KLogo(),
                  SizedBox(height: context.screenHeight * 0.05),
                  _loginFormWidget(),
                  const ForgotPasswordTextButton(),
                  SizedBox(height: context.screenHeight * 0.04),
                  _buildLoginButton(),
                  const SizedBox(height: 10),
                  const CreateANewAccountTextButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginFormWidget() {
    return Column(
      children: [
        KTextFormFiled(
          controller: emailTextController,
          validator: (value) {
            if (value.toString().isEmpty) {
              return Message.emptyEmail;
            } else if (!value.toString().isValidEmail) {
              return Message.invalidEmail;
            }
            return null;
          },
          inputAction: TextInputAction.next,
          inputType: TextInputType.emailAddress,
          labelText: 'Email',
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: passwordTextController,
          validator: (value) {
            if (value.toString().isEmpty) {
              return Message.emptyPassword;
            } else if (value.toString().length < 6) {
              return Message.invalidPassword;
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          obscureText: passwordVisibility,
          decoration: InputDecoration(
            isDense: true,
            labelText: 'Password',
            border: const OutlineInputBorder(),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  passwordVisibility = !passwordVisibility;
                });
              },
              child: Icon(
                passwordVisibility ? Icons.visibility_off : Icons.visibility,
                color: kBlackLight,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return KButton(
      onPressed: () => _loginMethod(),
      child: Text(
        'Login',
        style: context.buttonTextStyle,
      ),
    );
  }

  void _loginMethod() {
    // if (_loginFormKey.currentState!.validate()) {}
    context.pushNamedAndRemoveUntil(RouteGenerator.dashboard);
  }
}
