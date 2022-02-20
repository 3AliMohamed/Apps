import 'dart:core';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_flutter/shared/components/componants.dart';
import 'package:udemy_flutter/shared/components/constants.dart';
import 'package:udemy_flutter/shared/cubit/cubit.dart';
import 'package:udemy_flutter/shared/cubit/states.dart';
class HomeLayout extends StatelessWidget {

  var scaffoldKey=GlobalKey<ScaffoldState>();
  var formKey=GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeeController = TextEditingController();
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          if(state is AppInsertDataBaseState)
            {
              Navigator.pop(context);
            }
        } ,
        builder: (context, state) {
          AppCubit cubit=AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataBaseLoadingState  ,
              builder: (context) => cubit.screeens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                cubit.fabIcon,
              ),
              onPressed: ()
              {
                if(cubit.isBottonSheetShown)
                {
                   if(formKey.currentState.validate())
                     {
                       cubit.insertToDatabase(
                           title: titleController.text,
                           time: timeeController.text,
                           date: dateController.text
                       );
                  //   insertToDatabase(title: titleController.text,
                  //       time: timeeController.text,
                  //       date: dateController.text).then((value)
                  //   {
                  //     Navigator.pop(context);
                  //     isBottonSheetShown=false;
                  //     // setState(() {
                  //     //   fabIcon=Icons.edit;
                  //     // });
                  //   });
                    }
                }
                else
                {
                  scaffoldKey.currentState.showBottomSheet((context) =>
                      Container(
                        padding: EdgeInsets.all(20.0),
                        color: Colors.grey[100],
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              defaultFormFeild(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                    return'Title Must Not be Empty';
                                  return null;
                                },
                                label: 'Task Title',
                                prefix:Icons.title,
                              ),
                              SizedBox(height: 15.0),
                              defaultFormFeild(
                                  controller: timeeController,
                                  type: TextInputType.datetime,
                                  validate: (String value)
                                  {
                                    if(value.isEmpty)
                                      return'Time Must Not be Empty';
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix:Icons.watch_later_outlined,
                                  ontap: ()
                                  {
                                    showTimePicker(
                                      context: context,
                                      initialTime:  TimeOfDay.now(),
                                    ).then((value) =>
                                    timeeController.text=value.format(context).toString()
                                    );
                                  }
                              ),
                              SizedBox(height: 15.0),
                              defaultFormFeild(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  validate: (String value)
                                  {
                                    if(value.isEmpty)
                                      return'Date Must Not be Empty';
                                    return null;
                                  },
                                  label: 'Task Date ',
                                  prefix:Icons.calendar_today,
                                  ontap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2022-01-31'),
                                    ).then((value) {
                                      //rint(DateFormat.yMMMd().format(value));
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),
                      ),
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(
                        isShowButtomSheet: false,
                        icon: Icons.edit,
                    );
                    titleController.text='';
                    timeeController.text='';
                    dateController.text='';
                  }
                  );
                  cubit.changeBottomSheetState(
                      isShowButtomSheet: true,
                      icon: Icons.add
                  );
                }
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu),
                    label: "Tasks"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline),
                    label: "Done"
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined),
                    label: "Archived"
                ),
              ],
            ) ,
          );
        },
      )
    );
  }

}


