import 'package:equatable/equatable.dart';

abstract class PrivacyEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class TogglePrivacyMode extends PrivacyEvent {}
class ToggleFingerprintUnlock extends PrivacyEvent {}
class ToggleAutoLock extends PrivacyEvent {}