import 'package:equatable/equatable.dart';

class PrivacyState extends Equatable {
  final bool privacyMode;
  final bool fingerprintUnlock;
  final bool autoLock;
  final bool darkMode;

  const PrivacyState({
    this.privacyMode = true,
    this.fingerprintUnlock = true,
    this.autoLock = true,
    this.darkMode = false,
  });

  PrivacyState copyWith({
    bool? privacyMode,
    bool? fingerprintUnlock,
    bool? autoLock,
    bool? darkMode,
  }) {
    return PrivacyState(
      privacyMode: privacyMode ?? this.privacyMode,
      fingerprintUnlock: fingerprintUnlock ?? this.fingerprintUnlock,
      autoLock: autoLock ?? this.autoLock,
      darkMode: darkMode ?? this.darkMode,
    );
  }

  @override
  List<Object?> get props => [privacyMode, fingerprintUnlock, autoLock, darkMode];
}