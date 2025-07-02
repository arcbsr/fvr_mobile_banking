import 'package:equatable/equatable.dart';
import 'package:moix_app/features/home/domain/entities/user_entity.dart';

class FeedbackState extends Equatable {
  final int rating;
  final String text;
  final bool submitted;
  final User? user;

  const FeedbackState({
    this.rating = 0,
    this.text = '',
    this.submitted = false,
    this.user,
  });

  FeedbackState copyWith({
    int? rating,
    String? text,
    bool? submitted,
    User? user,
  }) {
    return FeedbackState(
      rating: rating ?? this.rating,
      text: text ?? this.text,
      submitted: submitted ?? this.submitted,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [rating, text, submitted];
}
