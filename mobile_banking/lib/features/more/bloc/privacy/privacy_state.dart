import 'package:equatable/equatable.dart';

class PrivacyState extends Equatable {
  final bool privacyMode;
  final bool fingerprintUnlock;
  final bool autoLock;

  const PrivacyState({
    this.privacyMode = true,
    this.fingerprintUnlock = true,
    this.autoLock = true,
  });

  PrivacyState copyWith({
    bool? privacyMode,
    bool? fingerprintUnlock,
    bool? autoLock,
  }) {
    return PrivacyState(
      privacyMode: privacyMode ?? this.privacyMode,
      fingerprintUnlock: fingerprintUnlock ?? this.fingerprintUnlock,
      autoLock: autoLock ?? this.autoLock,
    );
  }

  @override
  List<Object?> get props => [privacyMode, fingerprintUnlock, autoLock];
}