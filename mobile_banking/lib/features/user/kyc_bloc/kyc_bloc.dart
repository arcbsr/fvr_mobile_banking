import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moix_app/features/user/auth_api/user_api_repository.dart';
import 'package:moix_app/features/user/model/user_kyc.dart';
import 'kyc_event.dart';
import 'kyc_state.dart';

class KycBloc extends Bloc<KycEvent, KycState> {
  final UserApiRepository userApiRepository;
  KycBloc({required this.userApiRepository}) : super(const KycState()) {
    on<GoToNextKycPage>((event, emit) {
      emit(state.copyWith(currentPage: state.currentPage + 1));
    });

    on<GoToPreviousKycPage>((event, emit) {
      emit(state.copyWith(currentPage: state.currentPage - 1));
    });

    on<SelectVerificationMethod>((event, emit) {
      if (state.selectedMethod != event.method) {
        // Method changed → clear images
        emit(state.copyWith(
          selectedMethod: event.method,
          idOrPassportImageList: [],
        ));
      }
    });


 /*   on<UploadIdImage>((event, emit) {
      final updatedList = List<String>.from(state.idOrPassportImageList)
        ..add(event.filePath);
      emit(state.copyWith(idOrPassportImageList: updatedList));
    });

    on<UploadFaceImage>((event, emit) {
      emit(state.copyWith(faceImagePath: event.filePath));
    });*/

    on<UploadIdImage>((event, emit) {
      final updatedList = List<File>.from(state.idOrPassportImageList)
        ..add(event.filePath);
      emit(state.copyWith(idOrPassportImageList: updatedList));
    });

    on<UploadFaceImage>((event, emit) {
      emit(state.copyWith(faceImage: event.filePath));
    });

    on<KycRequestSubmitted>((event, emit) async {
      emit(state.copyWith(status: KycStatus.loading));
      try {
        Map<String, dynamic> data = {
          'userId': event.userId,
          'loginCode': event.loginCode,
          'id_type': event.id_type,
          'address_doc_type': event.address_doc_type,
          'identification_document': event.identification_document,
          'face_verification_image': event.face_verification_image,
          'address_document': event.address_document,
        };

        print("data object $data");
        final UserKyc getData = await userApiRepository.userKyc(data);
        if (getData.status == true) {

          print("data object getData $getData");
          emit(state.copyWith(status: KycStatus.success));
        } else {
          emit(
            state.copyWith(
              status: KycStatus.failure,
              errorMessage: "Invalid credentials",
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: KycStatus.failure,
            errorMessage: e.toString(),
          ),
        );
      }
    });
  }
}