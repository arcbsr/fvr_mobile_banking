import 'package:equatable/equatable.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object?> get props => [];
}

class LanguageSelected extends LanguageEvent {
  final String selectedLanguage;

  const LanguageSelected(this.selectedLanguage);

  @override
  List<Object?> get props => [selectedLanguage];
}