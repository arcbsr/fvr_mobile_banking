import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repositories/real_home_repository.dart';
import '../../data/models/accounts_model.dart';
import '../../../../core/utils/shared_preferences_helper.dart';

part 'home_event.dart';
part 'home_state.dart';
 
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final RealHomeRepository _homeRepository = RealHomeRepository();
  
  HomeBloc() : super(HomeInitial()) {
    on<LoadAccounts>(_onLoadAccounts);
  }

  Future<void> _onLoadAccounts(LoadAccounts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      // Get stored credentials
      final userId = await SharedPreferencesHelper().getUserId();
      final loginCode = await SharedPreferencesHelper().getLoginCode();
      
      if (userId.isEmpty || loginCode.isEmpty) {
        emit(HomeError('User credentials not found'));
        return;
      }

      // Call the accounts API
      final accountsData = await _homeRepository.getAccounts(
        userId: userId,
        loginCode: loginCode,
        accounts: '1',
        screen: '1',
      );

      emit(HomeAccountsLoaded(accountsData));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
} 