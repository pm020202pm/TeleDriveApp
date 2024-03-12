import 'package:equatable/equatable.dart';

class NavStates extends Equatable {
  const NavStates({
    this.index = 0,
    this.isDarkMode = false,
  });

  final int index;
  final bool isDarkMode;
  NavStates copyWith({int? index, bool? isDarkMode}) {
    return NavStates(
      index: index ?? this.index,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index, isDarkMode];
}
