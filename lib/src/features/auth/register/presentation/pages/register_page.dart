import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_logo.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/auth/register/presentation/widgets/go_to_login_text_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _registerFormKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _registerFormKey,
              child: Column(
                children: [
                  /// logo and loginWithPassword text
                  SizedBox(height: context.screenHeight * 0.03),
                  const KLogo(),
                  Text(
                    'Create A New Account',
                    style: context.textTheme.titleMedium,
                  ),

                  /// name textField
                  SizedBox(height: context.screenHeight * 0.03),
                  _buildNameTextFiled(),

                  /// email textField
                  SizedBox(height: context.screenHeight * 0.02),
                  _buildEmailTextFiled(),

                  /// phone textField
                  SizedBox(height: context.screenHeight * 0.02),
                  _buildPhoneTextFiled(),

                  /// password textField
                  SizedBox(height: context.screenHeight * 0.02),
                  _buildPasswordTextFiled(),

                  /// login button
                  SizedBox(height: context.screenHeight * 0.05),
                  _buildRegisterButton(context),

                  /// already have an account , login text
                  const SizedBox(height: 10),
                  const GoToLoginTextButton(),
                  SizedBox(height: context.screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameTextFiled() => KTextFormField(
        controller: nameController,
        labelText: 'Name',
        inputAction: TextInputAction.next,
        inputType: TextInputType.name,
        validator: (value) {
          if (value.toString().isEmpty) {
            return Message.emptyName;
          }
          return null;
        },
      );

  Widget _buildEmailTextFiled() => KTextFormField(
        controller: emailController,
        labelText: 'Email',
        inputAction: TextInputAction.next,
        inputType: TextInputType.emailAddress,
        validator: (value) {
          if (value.toString().isEmpty) {
            return Message.emptyEmail;
          } else if (!value.toString().isValidEmail) {
            return Message.invalidEmail;
          }
          return null;
        },
      );

  Widget _buildPhoneTextFiled() => KTextFormField(
        controller: phoneController,
        labelText: 'Phone',
        inputAction: TextInputAction.next,
        inputType: TextInputType.phone,
        validator: (value) {
          if (value.toString().isEmpty) {
            return Message.emptyPhone;
          } else if (!value.toString().isValidPhone) {
            return Message.invalidPhone;
          }
          return null;
        },
      );

  Widget _buildPasswordTextFiled() => KTextFormField(
        controller: passwordController,
        labelText: 'Password',
        inputAction: TextInputAction.done,
        inputType: TextInputType.visiblePassword,
        obscureValue: passwordVisibility,
        suffix: GestureDetector(
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
        validator: (value) {
          if (value.toString().isEmpty) {
            return Message.emptyPassword;
          } else if (value.toString().length < 6) {
            return Message.invalidPassword;
          }
          return null;
        },
      );

  Widget _buildRegisterButton(BuildContext context) => KButton(
        onPressed: () => _registerMethod(context),
        child: Text(
          'Register',
          style: context.buttonTextStyle,
        ),
      );

  void _registerMethod(BuildContext context) {
    context.unFocusKeyboard();
    if (_registerFormKey.currentState!.validate()) {
      // authController.register(
      //   name: nameController.text.trim(),
      //   email: emailController.text.trim(),
      //   phone: phoneController.text.trim(),
      //   password: passwordController.text.trim(),
      //   userType: UserType.customer.name,
      //   deviceToken: deviceTokenToSendPushNotification,
      // );
    }
  }
}
