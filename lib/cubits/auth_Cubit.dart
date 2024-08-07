import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:store_app/cubit_State/auth_State.dart';
import 'package:store_app/models/user_model.dart';
import 'package:store_app/shared/local_network.dart';


class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitialState());

  final Dio _dio = Dio();

  Future<void> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(AuthLoadingState());

    try {
      final data = {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
      };

      print('Request Data: $data');

      final response = await _dio.post(
        "https://student.valuxapps.com/api/register",
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        if (response.data['status'] == true) {
          emit(AuthSuccessToRegisteState());
        } else {
          emit(AuthFaildToRegisteState(message: response.data['message']));
        }
      } else {
        emit(AuthFaildToRegisteState(
            message: 'Server error: ${response.statusCode}'));
      }
    } catch (e) {
      print('Error: $e');
      emit(AuthFaildToRegisteState(message: e.toString()));
    }
  }
}


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  UserModel? userModel;
  final Dio dio = Dio();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    try {
      final response = await dio.post(
        "https://student.valuxapps.com/api/login",
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
        data: {
          'email': email,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        var responseData = response.data;
        if (responseData['status'] == true) {
          userModel = UserModel.fromJson(responseData['data']);
          await CacheNetwork.insertToCache(key: "token", value: userModel!.token!);
          emit(LoginSuccessState(userModel: userModel!));
        } else {
          emit(LoginFailedState(message: responseData['message']));
        }
      } else {
        emit(LoginFailedState(message: "Login failed with status code: ${response.statusCode}"));
      }
    } catch (e) {
      emit(LoginFailedState(message: e.toString()));
    }
  }
}


class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitialState());

  final Dio dio = Dio();

  Future<void> logout() async {
    emit(LogoutLoadingState());

    try {
      final token = await CacheNetwork.getCacheData(key: 'token');

      print('Token retrieved: $token');

      final response = await dio.post(
        "https://student.valuxapps.com/api/logout",
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 && response.data['status'] == true) {
        await CacheNetwork.deleteCacheItem(key: 'token');
        emit(LogoutSuccessState());
      } else {
        emit(LogoutFaildState(message: response.data['message'] ?? 'Logout failed'));
      }
        } catch (e) {
      print('Error: $e');
      emit(LogoutFaildState(message: e.toString()));
    }
  }
}
