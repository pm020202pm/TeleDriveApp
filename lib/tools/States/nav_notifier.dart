
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'NavStates.dart';

final navProvider =
    StateNotifierProvider<navNotifier, NavStates>((ref) => navNotifier());

class navNotifier extends StateNotifier<NavStates> {
  navNotifier() : super(NavStates());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
    //state.index;
  }

  void toggleTheme() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }
}
