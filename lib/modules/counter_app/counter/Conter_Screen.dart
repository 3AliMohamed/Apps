import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/modules/counter_app/counter/cubit/cubit.dart';
import 'package:udemy_flutter/modules/counter_app/counter/cubit/states.dart';

class ConterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit,CounterStates>(
      listener: (context, state) {
        // if(state is CounterMinusState) print("minus state ${state.counter}");
        // if(state is CounterPlusState) print("plus state ${state.counter}");
      } ,
      builder: (context, state )
      {
          return Scaffold(
            appBar: AppBar(
              title: Text('${CounterCubit.get(context).counter}'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                [
                  TextButton(onPressed: (){
                    CounterCubit.get(context).minus();
                  },
                    child: Text(
                      'Minus',
                    ),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0 ,
                    ),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 50.0
                      ),
                    ),
                  ),
                  TextButton(onPressed: (){
                    CounterCubit.get(context).Plus();
                  },
                    child: Text(
                      'Plus',
                    ),
                  ) ,
                ],
              ),
            ),
          );
          },
    );
  }
}

