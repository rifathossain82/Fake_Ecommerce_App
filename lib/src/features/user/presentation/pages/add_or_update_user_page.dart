import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:fake_ecommerce_app/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrUpdateUserPage extends StatefulWidget {
  final PageType pageType;
  final UserModel? user;

  const AddOrUpdateUserPage({
    Key? key,
    required this.pageType,
    this.user,
  }) : super(key: key);

  @override
  State<AddOrUpdateUserPage> createState() => _AddOrUpdateUserPageState();
}

class _AddOrUpdateUserPageState extends State<AddOrUpdateUserPage> {
  final firstNameTextController = TextEditingController();
  final lastNameTextController = TextEditingController();
  final usernameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final cityTextController = TextEditingController();
  final streetTextController = TextEditingController();
  final zipcodeTextController = TextEditingController();
  final addressNumberTextController = TextEditingController();
  final latitudeTextController = TextEditingController();
  final longitudeTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.pageType == PageType.update) {
      firstNameTextController.text = widget.user?.name?.firstname ?? '';
      lastNameTextController.text = widget.user?.name?.lastname ?? '';
      usernameTextController.text = widget.user?.username ?? '';
      emailTextController.text = widget.user?.email ?? '';
      phoneTextController.text = widget.user?.phone ?? '';
      passwordTextController.text = widget.user?.password ?? '';
      cityTextController.text = widget.user?.address?.city ?? '';
      streetTextController.text = widget.user?.address?.street ?? '';
      zipcodeTextController.text = widget.user?.address?.zipcode ?? '';
      addressNumberTextController.text = '${widget.user?.address?.number}';
      latitudeTextController.text =
          widget.user?.address?.geolocation?.lat ?? '';
      longitudeTextController.text =
          widget.user?.address?.geolocation?.long ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    firstNameTextController.dispose();
    lastNameTextController.dispose();
    usernameTextController.dispose();
    emailTextController.dispose();
    phoneTextController.dispose();
    passwordTextController.dispose();
    cityTextController.dispose();
    streetTextController.dispose();
    zipcodeTextController.dispose();
    addressNumberTextController.dispose();
    latitudeTextController.dispose();
    longitudeTextController.dispose();
    super.dispose();
  }

  void clearForm() {
    firstNameTextController.clear();
    lastNameTextController.clear();
    usernameTextController.clear();
    emailTextController.clear();
    phoneTextController.clear();
    passwordTextController.clear();
    cityTextController.clear();
    streetTextController.clear();
    zipcodeTextController.clear();
    addressNumberTextController.clear();
    latitudeTextController.clear();
    longitudeTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pageType.name.capitalizedFirst} User'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Form(
            key: _formKey,
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: KTextFormFiled(
                                controller: firstNameTextController,
                                labelText: 'First Name *',
                                validator: (value) {
                                  if (value.toString().isEmpty) {
                                    return Message.emptyField;
                                  }
                                  return null;
                                },
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.name,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: KTextFormFiled(
                                controller: lastNameTextController,
                                labelText: 'Last Name',
                                inputAction: TextInputAction.next,
                                inputType: TextInputType.name,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: usernameTextController,
                        labelText: 'Username *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.name,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: emailTextController,
                        labelText: 'Email *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          } else if (!value.toString().isValidEmail) {
                            return Message.invalidEmail;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: phoneTextController,
                        labelText: 'Phone *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.phone,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: passwordTextController,
                        labelText: 'Password *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          } else if (value.toString().length < 6) {
                            return Message.invalidPassword;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: cityTextController,
                        labelText: 'City',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.streetAddress,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: streetTextController,
                        labelText: 'Street',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.streetAddress,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: zipcodeTextController,
                        labelText: 'Zip Code',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: addressNumberTextController,
                        labelText: 'Address Number',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: latitudeTextController,
                        labelText: 'Latitude',
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      KTextFormFiled(
                        controller: longitudeTextController,
                        labelText: 'Longitude',
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: context.isDark ? kDarkScaffoldBgColor : kWhite,
              child: KButton(
                onPressed: addOrUpdateMethod,
                child: BlocConsumer<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is UserError) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: failedColor,
                      );
                    }
                    if (state is UserAddedSuccess) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: successColor,
                      );

                      /// when user added success then clear the form
                      /// and pop the screen with result true
                      clearForm();
                      context.pop(result: true);
                    }
                    if (state is UserUpdateSuccess) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: successColor,
                      );

                      /// when user updated success then clear the form
                      /// and pop the screen with result true
                      clearForm();
                      context.pop(result: true);
                    }
                  },
                  builder: (context, state) {
                    if (state is UserLoading) {
                      return SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: kWhite,
                        ),
                      );
                    } else {
                      return Text(
                        widget.pageType.name.capitalizedFirst,
                        style: context.buttonTextStyle,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addOrUpdateMethod() {
    if (_formKey.currentState!.validate()) {
      final UserModel userModel = UserModel(
        name: Name(
          firstname: firstNameTextController.text.trim(),
          lastname: lastNameTextController.text.trim(),
        ),
        email: emailTextController.text.trim(),
        phone: phoneTextController.text.trim(),
        password: passwordTextController.text.trim(),
        username: usernameTextController.text.trim(),
        address: Address(
          city: cityTextController.text.trim(),
          street: streetTextController.text.trim(),
          zipcode: zipcodeTextController.text.trim(),
          number: addressNumberTextController.text.isNotEmpty
              ? int.parse(addressNumberTextController.text)
              : null,
          geolocation: Geolocation(
            lat: latitudeTextController.text.trim(),
            long: longitudeTextController.text.trim(),
          ),
        ),
      );

      if (widget.pageType == PageType.add) {
        context
            .read<UserBloc>()
            .add(AddNewUser(requestBody: userModel.toJson()));
      } else {
        userModel.id = widget.user?.id;
        context
            .read<UserBloc>()
            .add(UpdateUser(requestBody: userModel.toJson()));
      }
    }
  }
}
