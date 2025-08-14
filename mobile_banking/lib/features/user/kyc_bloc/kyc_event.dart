import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class KycEvent extends Equatable {
  const KycEvent();

  @override
  List<Object?> get props => [];
}

class GoToNextKycPage extends KycEvent {}

class GoToPreviousKycPage extends KycEvent {}

class SelectVerificationMethod extends KycEvent {
  final String method;

  const SelectVerificationMethod(this.method);

  @override
  List<Object?> get props => [method];
}

class UploadIdImage extends KycEvent {
  final String side;
  final File filePath;

  const UploadIdImage({required this.side, required this.filePath});

  @override
  List<Object?> get props => [side, filePath];
}

class UploadFaceImage extends KycEvent {
  final String side;
  final File filePath;

  const UploadFaceImage({required this.side, required this.filePath});

  @override
  List<Object?> get props => [side, filePath];
}

class KycRequestSubmitted extends KycEvent {
  final String userId;
  final String loginCode;
  final String id_type;
  final String address_doc_type;
  final File identification_document;
  final File address_document;
  final File face_verification_image;

  KycRequestSubmitted({
    required this.userId,
    required this.loginCode,
    required this.id_type,
    required this.address_doc_type,
    required this.identification_document,
    required this.address_document,
    required this.face_verification_image,
  });
}
