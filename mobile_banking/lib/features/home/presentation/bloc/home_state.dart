part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  // Add demo data fields here
}

class HomeLoading extends HomeState {}

class HomeAccountsLoaded extends HomeState {
  final AccountsModel accountsData;
  
  const HomeAccountsLoaded(this.accountsData);
  
  @override
  List<Object> get props => [accountsData];
}

class HomeError extends HomeState {
  final String message;
  
  const HomeError(this.message);
  
  @override
  List<Object> get props => [message];
} 