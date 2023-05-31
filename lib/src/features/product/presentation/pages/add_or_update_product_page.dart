import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/errors/messages.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_button.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:fake_ecommerce_app/src/features/product/data/models/product_model.dart';
import 'package:fake_ecommerce_app/src/features/product/presentation/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrUpdateProductPage extends StatefulWidget {
  final PageType pageType;
  final ProductModel? product;

  const AddOrUpdateProductPage({
    Key? key,
    required this.pageType,
    this.product,
  }) : super(key: key);

  @override
  State<AddOrUpdateProductPage> createState() => _AddOrUpdateProductPageState();
}

class _AddOrUpdateProductPageState extends State<AddOrUpdateProductPage> {
  final titleTextController = TextEditingController();
  final priceTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final imgTextController = TextEditingController();
  final categoryTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.pageType == PageType.update) {
      titleTextController.text = widget.product?.title ?? '';
      priceTextController.text = '${widget.product?.price ?? ''}';
      descriptionTextController.text = widget.product?.description ?? '';
      imgTextController.text = widget.product?.image ?? '';
      categoryTextController.text = widget.product?.category ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    titleTextController.dispose();
    priceTextController.dispose();
    descriptionTextController.dispose();
    imgTextController.dispose();
    categoryTextController.dispose();
    super.dispose();
  }

  void clearForm() {
    titleTextController.clear();
    priceTextController.clear();
    descriptionTextController.clear();
    imgTextController.clear();
    categoryTextController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.pageType.name.capitalizedFirst} Product'),
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
                      KTextFormField(
                        controller: titleTextController,
                        labelText: 'Title *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        maxLines: 1,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      KTextFormField(
                        controller: priceTextController,
                        labelText: 'Price *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      KTextFormField(
                        controller: descriptionTextController,
                        labelText: 'Description *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        maxLines: 5,
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      KTextFormField(
                        controller: imgTextController,
                        labelText: 'Image (url) *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                      ),
                      const SizedBox(height: 15),
                      KTextFormField(
                        controller: categoryTextController,
                        labelText: 'Category *',
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return Message.emptyField;
                          }
                          return null;
                        },
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.text,
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
                child: BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is ProductError) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: failedColor,
                      );
                    }
                    if (state is ProductAddedSuccess) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: successColor,
                      );

                      /// when product added success then clear the form
                      /// and pop the screen with result true
                      clearForm();
                      context.pop(result: true);
                    }
                    if (state is ProductUpdatedSuccess) {
                      context.showSnackBar(
                        message: state.message,
                        bgColor: successColor,
                      );

                      /// when product updated success then clear the form
                      /// and pop the screen with result true
                      clearForm();
                      context.pop(result: true);
                    }
                  },
                  builder: (context, state) {
                    if (state is ProductLoading) {
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
      final Map<String, dynamic> requestBody = {
        'title': titleTextController.text.trim(),
        'price': priceTextController.text.trim(),
        'description': descriptionTextController.text.trim(),
        'image': imgTextController.text.trim(),
        'category': categoryTextController.text.trim(),
      };

      if (widget.pageType == PageType.add) {
        context.read<ProductBloc>().add(AddProduct(requestBody: requestBody));
      } else {
        requestBody['id'] = '${widget.product?.id}';

        context
            .read<ProductBloc>()
            .add(UpdateProduct(requestBody: requestBody));
      }
    }
  }
}
