import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/utils/styles.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  _buildForgotPasswordText(),
                  SizedBox(height: context.screenHeight * 0.04),
                  _buildLoginButton(),
                  const SizedBox(height: 10),
                  _buildGoToRegisterText(),
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
        TextFormField(
          controller: emailTextController,
          validator: (value) {
            if (value.toString().isEmpty) {
              return Message.emptyEmail;
            } else if (!value.toString().isValidEmail) {
              return Message.invalidEmail;
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            isDense: true,
            labelText: 'Email',
            border: OutlineInputBorder(),
          ),
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

  Widget _buildForgotPasswordText() => GestureDetector(
        onTap: () {
          // Get.to(() => ForgotPasswordScreen());
        },
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              'Forgot Password?',
              style: MyTextStyles.h4.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget _buildGoToRegisterText() => GestureDetector(
        onTap: () {
          context.pushReplacementNamed(RouteGenerator.register);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Don't have an Account?",
                style: MyTextStyles.h5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Create a new Account",
                    style: MyTextStyles.h4.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget _buildLoginButton() => KButton(
        onPressed: () => _loginMethod(),
        child: Text(
          'Login',
          style: GoogleFonts.roboto(
            textStyle: MyTextStyles.h3.copyWith(
              color: kWhite,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );

  void _loginMethod() {
    // if (_loginFormKey.currentState!.validate()) {}
    // Get.offAllNamed(RouteGenerator.welcome);
  }
}
