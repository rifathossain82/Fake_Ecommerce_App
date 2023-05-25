import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/user/data/model/user_model.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pageType.name.capitalizedFirst} User'),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: KTextFormFiled(
                              controller: firstNameTextController,
                              labelText: 'First Name *',
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
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                    ),
                    const SizedBox(height: 15),
                    KTextFormFiled(
                      controller: emailTextController,
                      labelText: 'Email *',
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    KTextFormFiled(
                      controller: phoneTextController,
                      labelText: 'Phone *',
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    KTextFormFiled(
                      controller: passwordTextController,
                      labelText: 'Password *',
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
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(15),
              color: kWhite,
              child: KButton(
                onPressed: () {},
                child: Text(
                  widget.pageType.name.capitalizedFirst,
                  style: context.buttonTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
