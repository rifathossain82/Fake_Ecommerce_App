import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/core/widgets/k_text_form_field.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final TextEditingController limitTextController;
  final ValueChanged onChangedLimit;
  final SortingType? selectedSortingType;
  final ValueChanged onChangedSorting;
  final VoidCallback onTapAddButton;

  const FilterWidget({
    Key? key,
    required this.limitTextController,
    required this.onChangedLimit,
    required this.selectedSortingType,
    required this.onChangedSorting,
    required this.onTapAddButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: KTextFormField(
                controller: limitTextController,
                onChanged: onChangedLimit,
                labelText: 'Limit',
                maxLines: 1,
                inputType: TextInputType.number,
                inputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 3,
              child: DropdownButtonFormField(
                isDense: true,
                autofocus: false,
                decoration: const InputDecoration(
                  isDense: true,
                  labelText: 'Sort',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  border: OutlineInputBorder(),
                ),
                items: SortingType.values
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e.name.capitalizedFirst,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    )
                    .toList(),
                value: selectedSortingType,
                onChanged: onChangedSorting,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: GestureDetector(
                onTap: onTapAddButton,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: context.isDark ? kWhite : context.primaryColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.add,
                    color: context.isDark ? context.primaryColor : kWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
