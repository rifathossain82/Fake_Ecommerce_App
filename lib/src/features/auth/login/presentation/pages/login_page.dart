import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/routes/routes.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:fake_ecommerce_app/src/features/auth/login/presentation/widgets/create_a_new_account_text_button.dart';
import 'package:fake_ecommerce_app/src/features/auth/login/presentation/widgets/forgot_password_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  bool passwordVisibility = true;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNameTextController.dispose();
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
        KTextFormField(
          controller: userNameTextController,
          validator: (value) {
            if (value.toString().isEmpty) {
              return Message.emptyField;
            }
            return null;
          },
          inputAction: TextInputAction.next,
          inputType: TextInputType.name,
          labelText: 'Username',
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
      onPressed: _loginMethod,
      child: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
        if (state is LoginError) {
          context.showSnackBar(
            message: state.message,
            bgColor: failedColor,
          );
        }
        if (state is LoginLoaded) {
          context.showSnackBar(
            message: 'Login Success!',
            bgColor: successColor,
          );
          context.pushNamedAndRemoveUntil(routeName: RouteGenerator.dashboard);
        }
      }, builder: (context, state) {
        if (state is LoginLoading) {
          return SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: kWhite,
            ),
          );
        } else {
          return Text(
            'Login',
            style: context.buttonTextStyle,
          );
        }
      }),
    );
  }

  void _loginMethod() {
    if (_loginFormKey.currentState!.validate()) {
      context.read<LoginBloc>().add(
            Login(
              requestBody: {
                'username': userNameTextController.text.trim(),
                'password': passwordTextController.text.trim(),
              },
            ),
          );
    }
  }
}
