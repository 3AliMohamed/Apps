import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/models/shop_app/login_model.dart';
import 'package:udemy_flutter/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_flutter/shared/network/end_points.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) =>BlocProvider.of(context);
  ShopLoginModel loginModel ;
  void userLogin({
    @required String email,
    @required String password,
  })
  {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN,
        data:
        {
        'email':email,
          'password':password,
        },
    ).then((value) {
      print(value.data);
      loginModel=ShopLoginModel.fromjson(value.data);
      print(loginModel.status);
      print(loginModel.message);
      emit(ShopLoginSuccessState(loginModel));
    },).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  IconData suffix=Icons.visibility_outlined ;
  bool isPasswordShown=true;
  void changePasswordVisibility()
  {
    isPasswordShown=!isPasswordShown;
    suffix = isPasswordShown ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(ShopLoginChangePasswordVisibility());
  }

}