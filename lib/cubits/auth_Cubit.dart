import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:store_app/cubit_State/auth_State.dart';
import 'package:store_app/shared/local_network.dart';
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

      print('Request Data: $data'); // Log the request data

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
      print('Error: $e'); // Log the error
      emit(AuthFaildToRegisteState(message: e.toString()));
    }
  }
}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

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
        var responseData = jsonDecode(response.data);
        if (response.data['status'] == true) {
          await CacheNetwork.insertToCache(key: "token", value: responseData['data']['token']);
          emit(LoginSuccessState());
        } else {
          emit(LoginFailedState(message: response.data['message']));
        }
      }
    }catch (e) {
      emit(LoginFailedState(message: e.toString()));
  }}
}