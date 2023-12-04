part of 'gender_cubit.dart';

class GenderState extends Equatable {
  final String gender;
  final bool isFilterCardOpen;
  const GenderState({required this.isFilterCardOpen, required this.gender});

  @override
  List<Object> get props => [gender, isFilterCardOpen];
}

class GenderInitial extends GenderState {
  const GenderInitial({
    required String gender,
    bool? isFilterCardOpen,
  }) : super(gender: gender, isFilterCardOpen: false);
}

class GenderLoading extends GenderState {
  const GenderLoading({
    required String gender,
    bool? isFilterCardOpen,
  }) : super(gender: gender, isFilterCardOpen: false);
}

class GenderLoaded extends GenderState {
  final List<UserApiResults> userData;

  const GenderLoaded({
    required this.userData,
    required String gender,
    bool? isFilterCardOpen,
  }) : super(gender: gender, isFilterCardOpen: true);
}

class GenderError extends GenderState {
  final String message;

  const GenderError(
      {bool? isFilterCardOpen, required String gender, required this.message})
      : super(gender: gender, isFilterCardOpen: false);
}
