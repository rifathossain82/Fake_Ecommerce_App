import 'package:equatable/equatable.dart';
import 'package:fake_ecommerce_app/src/core/di/injection_container.dart';
import 'package:fake_ecommerce_app/src/core/enums/app_enum.dart';
import 'package:fake_ecommerce_app/src/core/services/local_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  bool _isDark = false;

  bool get isDark {
    _isDark = sl<LocalStorage>().getData(key: LocalStorageKey.isDark) ?? false;
    return _isDark;
  }

  void changeDarkMode(bool value) {
    emit(SettingsInitial());
    _isDark = value;
    sl<LocalStorage>().saveData(key: LocalStorageKey.isDark, data: value);
    emit(SettingsLoaded());
  }
}
