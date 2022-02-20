import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:udemy_flutter/faceBook_task.dart';
import 'package:udemy_flutter/layout/news_app/news_layout.dart';
import 'package:udemy_flutter/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
import 'package:udemy_flutter/shared/network/local/cache_helper.dart';
import 'package:udemy_flutter/shared/network/remote/dio_helper.dart';
import 'package:udemy_flutter/shared/styles/thems.dart';
import 'layout/news_app/cubit/cubit.dart';
import 'layout/todoApp/todo_layout.dart';
import 'package:udemy_flutter/shared/bloc_observer.dart';
import 'modules/basics_app/home/Home_Screen.dart';
import 'modules/basics_app//login/login_Screen.dart';
import 'modules/basics_app//massenger/Massenger_Screen.dart';
import 'modules/basics_app//users/Users_Screen.dart';
import 'modules/counter_app//counter/Conter_Screen.dart';
import 'modules/bmi_app//bmi/Bmi_Screen.dart';
import 'modules/bmi_app//bmi_result/Bmi_Result_Screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getBoolean(key: 'isDark');

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(isDark));
}
class MyApp extends  StatelessWidget
{
  final bool isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()..getSports()..getScience()),
        BlocProvider(create: (context) => AppCubit()..changeAppThemeMode(fromShared: isDark))
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode:  AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light ,
              home: onBoardingScreen()
          );
        },
      ),
    );
  }


}