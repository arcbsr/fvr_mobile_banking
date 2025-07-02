import 'package:equatable/equatable.dart';
import 'package:moix_app/features/home/domain/entities/user_entity.dart';

abstract class FeedbackEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadFeedbackUser extends FeedbackEvent {}

class FeedbackRatingChanged extends FeedbackEvent {
  final int rating;
  FeedbackRatingChanged(this.rating);

  @override
  List<Object?> get props => [rating];
}

class FeedbackTextChanged extends FeedbackEvent {
  final String text;
  FeedbackTextChanged(this.text);

  @override
  List<Object?> get props => [text];
}

class SubmitFeedback extends FeedbackEvent {}