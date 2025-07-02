import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/repositories/demo_home_repository.dart';
import '../../../home/domain/entities/user_entity.dart';
import 'feedback_event.dart';
import 'feedback_state.dart';
class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  final DemoHomeRepository _repository;

  FeedbackBloc(this._repository) : super(
      FeedbackState() // temporary/initial
  ) {
    on<LoadFeedbackUser>(_onLoadUser);
    on<FeedbackRatingChanged>(_onRatingChanged);
    on<FeedbackTextChanged>(_onTextChanged);
    on<SubmitFeedback>(_onSubmit);
  }

  Future<void> _onLoadUser(LoadFeedbackUser event, Emitter<FeedbackState> emit) async {
    final user = await _repository.getUser();
    emit(state.copyWith(user: user));
  }

  void _onRatingChanged(FeedbackRatingChanged event, Emitter<FeedbackState> emit) {
    emit(state.copyWith(rating: event.rating));
  }

  void _onTextChanged(FeedbackTextChanged event, Emitter<FeedbackState> emit) {
    emit(state.copyWith(text: event.text));
  }

  void _onSubmit(SubmitFeedback event, Emitter<FeedbackState> emit) {
    emit(state.copyWith(submitted: true));
  }
}