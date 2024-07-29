import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:second/dio_helper.dart';
import 'package:second/screens/delete_address_screen.dart';
import 'package:second/screens/home_screen.dart';

import '../models/header_model.dart';
import '../models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;

  var screens = [HomeScreen(), deleteAdressScreen()];
  int currentIndex = 0;
  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavIndex());
  }

  ApiRequestModel request = ApiRequestModel(
    endpoint: 'home',
  );
  void getHomeData() {
    emit(ProductsLoading());

    DioHelper.getData(request).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(ProductsSuccess());
    }).catchError((error) {
      emit(ProductsFailure(error.toString()));
    });
  }
}
