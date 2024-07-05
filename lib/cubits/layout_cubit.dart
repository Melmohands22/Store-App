import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/cubit_State/layou_state.dart';

final Dio dio = Dio();

class LayoutCubit extends Cubit<LayouState> {
  LayoutCubit() : super(LayoutInitialState());

  UserModel? userModel;

  Future<void> getUserData() async {
    emit(GetUserDataLoadind());

    try {
      Response response = await dio.get(
        'https://student.valuxapps.com/api/profile',
        options: Options(
          headers: {
            "Authorization": "hEGOQ1mB4621b9Dt6cQVPmUnUExASe25loflP7xMQpuRrtkWWFUWRdVSi7uPJO435bVxK9",
            'lang': 'en'
          },
        ),
      );

      var responseData = response.data;

      if (responseData['status'] == true) {
        userModel = UserModel.fromJson(responseData['data']);
        emit(GetUserDataSuccess());
      } else {
        emit(GetUserDataFaild(message: responseData['message']));
      }
    } catch (e) {
      emit(GetUserDataFaild(message: e.toString()));
    }
  }
}

