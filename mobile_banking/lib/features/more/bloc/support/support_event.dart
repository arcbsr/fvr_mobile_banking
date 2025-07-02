import 'package:equatable/equatable.dart';

abstract class SupportEvent extends Equatable {
  const SupportEvent();

  @override
  List<Object?> get props => [];
}

class IssueSelected extends SupportEvent {
  final String issue;

  const IssueSelected(this.issue);

  @override
  List<Object?> get props => [issue];
}

class DetailsChanged extends SupportEvent {
  final String details;

  const DetailsChanged(this.details);

  @override
  List<Object?> get props => [details];
}

class SubmitSupportRequest extends SupportEvent {
  const SubmitSupportRequest();

  @override
  List<Object?> get props => [];
}