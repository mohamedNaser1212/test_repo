import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:second/models/adressess_model.dart';
import 'package:second/models/header_model.dart';

import '../dio_helper.dart';
import '../models/Prod_model.dart';

part 'adressess_state.dart';

class AdressessCubit extends Cubit<AdressessState> {
  AdressessCubit() : super(AdressessInitial());
  static AdressessCubit get(context) => BlocProvider.of(context);

  AdressessModel? adressessModel;
  ProdModel? model;

  ApiRequestModel request = ApiRequestModel(
    endpoint: 'addresses',
    data: {
      'name': 'name',
      'city': 'city',
      'region': 'region',
      'details': 'details',
      'latitude': 0,
      'longitude': 0,
      'notes': 'notes',
    },
  );

  void postAdressessData({
    required String name,
    required String city,
    required String region,
    required String details,
    required num latitude,
    required num longitude,
    required String notes,
  }) {
    emit(AdressessLoading());

    DioHelper.postData(request).then((value) {
      adressessModel = AdressessModel.fromJson(value.data);
      emit(AdressessSuccess(
        adressessModel!,
      ));
    }).catchError((error) {
      emit(AdressessFailure(error.toString()));
    });
  }

  putAdreessData({
    required int id,
    required String title,
    required num price,
    required String description,
    required String category,
  }) {
    emit(AdressessPutLoading());

    DioHelper.putData(request).then((value) {
      model = ProdModel.fromJson(value.data);
      emit(AdressessPutSuccess(model!));
    }).catchError((error) {
      print(error.toString());
      emit(AdressessPutFailure(error.toString()));
    });
  }
}
