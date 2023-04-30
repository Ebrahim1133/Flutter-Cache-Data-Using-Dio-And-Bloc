import 'package:bloc/bloc.dart';
import 'package:cachedatawithdio/dio_helper.dart';
import 'package:cachedatawithdio/employer_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  EmployerModel employerModel = EmployerModel();

  void getAllData() {
    emit(HomeLoading());
    DioHelper.getData(url: 'api/v1/employees').then((value) {
      employerModel = EmployerModel.fromJson(value.data);
      emit(HomeSucess());
    }).catchError((e) {
      emit(HomeError());
    });
  }
}
