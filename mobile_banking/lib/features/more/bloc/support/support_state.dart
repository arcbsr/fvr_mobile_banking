import 'package:equatable/equatable.dart';

class SupportState extends Equatable {
  final String selectedIssue;
  final String details;
  final bool submitted;

  const SupportState({
    this.selectedIssue = '',
    this.details = '',
    this.submitted = false,
  });

  SupportState copyWith({
    String? selectedIssue,
    String? details,
    bool? submitted,
  }) {
    return SupportState(
      selectedIssue: selectedIssue ?? this.selectedIssue,
      details: details ?? this.details,
      submitted: submitted ?? this.submitted,
    );
  }

  @override
  List<Object?> get props => [selectedIssue, details, submitted];
}