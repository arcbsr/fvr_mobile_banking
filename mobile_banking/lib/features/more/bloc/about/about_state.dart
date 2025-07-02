import 'package:equatable/equatable.dart';

class AboutState extends Equatable {
  final bool loaded;

  const AboutState({this.loaded = false});

  AboutState copyWith({bool? loaded}) {
    return AboutState(loaded: loaded ?? this.loaded);
  }

  @override
  List<Object?> get props => [loaded];
}