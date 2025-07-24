import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameState {
  final String name;
  final bool isLoading;
  final String? errorMessage;

  NameState({required this.name, this.isLoading = false, this.errorMessage});

  NameState copyWith({String? name, bool? isLoading, String? errorMessage}) {
    return NameState(
      name: name ?? this.name,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
    );
  }
}

class NameNotifier extends StateNotifier<NameState> {
  static const String _storageKey = 'user_name';

  NameNotifier() : super(NameState(name: ''));

  Future<void> loadName() async {
    state = state.copyWith(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedName = prefs.getString(_storageKey) ?? '';
      state = state.copyWith(name: savedName, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> saveName(String newName) async {
    state = state.copyWith(isLoading: true);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_storageKey, newName.trim());
      state = state.copyWith(name: newName.trim(), isLoading: false, errorMessage: null);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }
}

final nameProvider = StateNotifierProvider<NameNotifier, NameState>((ref) {
  final notifier = NameNotifier();
  notifier.loadName();
  return notifier;
});
