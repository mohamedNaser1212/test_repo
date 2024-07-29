part of 'adressess_cubit.dart';

@immutable
class AdressessState {}

final class AdressessInitial extends AdressessState {}

final class AdressessLoading extends AdressessState {}

final class AdressessSuccess extends AdressessState {
  final AdressessModel model;
  AdressessSuccess(this.model);
}

final class AdressessFailure extends AdressessState {
  final String errMessage;

  AdressessFailure(this.errMessage);
}

final class AdressessPutLoading extends AdressessState {}

final class AdressessPutSuccess extends AdressessState {
  final ProdModel model;
  AdressessPutSuccess(this.model);
}

final class AdressessPutFailure extends AdressessState {
  final String errMessage;

  AdressessPutFailure(this.errMessage);
}
