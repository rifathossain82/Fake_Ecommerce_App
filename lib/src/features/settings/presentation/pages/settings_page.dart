import 'package:fake_ecommerce_app/src/core/extensions/build_context_extension.dart';
import 'package:fake_ecommerce_app/src/core/utils/color.dart';
import 'package:fake_ecommerce_app/src/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          SettingsCubit settingsCubit = context.read<SettingsCubit>();
          return Column(
            children: [
              SwitchListTile(
                value: context.read<SettingsCubit>().isDark,
                onChanged: (value) {
                  settingsCubit.changeDarkMode(value);
                },
                title: Text(
                  'Theme',
                  style: context.textTheme.titleMedium,
                ),
                subtitle: Text(
                  settingsCubit.isDark ? 'Dark' : 'Light',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: kGreyTextColor,
                  ),
                ),
                secondary: Icon(
                  settingsCubit.isDark
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                dense: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
