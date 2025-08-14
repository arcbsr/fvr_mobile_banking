import 'dart:io';

import 'package:equatable/equatable.dart';

/// Status for KYC process
enum KycStatus { initial, loading, success, failure }

class KycState extends Equatable {
  final int currentPage;
  final String? selectedMethod;
  final File? faceImage;
  final List<File> idOrPassportImageList;
  final KycStatus status;
  final String? errorMessage;

  const KycState({
    this.currentPage = 0,
    this.selectedMethod,
    this.faceImage,
    this.idOrPassportImageList = const [], // ✅ now constant-safe (empty list)
    this.status = KycStatus.initial,
    this.errorMessage,
  });

  /// Named constructor for the initial state
  factory KycState.initial() {
    return const KycState(
      currentPage: 0,
      selectedMethod: null,
      faceImage: null,
      idOrPassportImageList: [],
      status: KycStatus.initial,
      errorMessage: null,
    );
  }

  /// Returns a new instance with updated values
  KycState copyWith({
    int? currentPage,
    String? selectedMethod,
    File? faceImage,
    List<File>? idOrPassportImageList,
    KycStatus? status,
    String? errorMessage,
  }) {
    return KycState(
      currentPage: currentPage ?? this.currentPage,
      selectedMethod: selectedMethod ?? this.selectedMethod,
      faceImage: faceImage ?? this.faceImage,
      idOrPassportImageList:
          idOrPassportImageList ?? this.idOrPassportImageList,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    currentPage,
    selectedMethod,
    faceImage,
    idOrPassportImageList,
    status,
    errorMessage,
  ];
}
