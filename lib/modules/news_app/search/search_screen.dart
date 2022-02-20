import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_flutter/layout/news_app/cubit/cubit.dart';
import 'package:udemy_flutter/layout/news_app/cubit/states.dart';
import 'package:udemy_flutter/shared/components/componants.dart';
class SearchScreen extends StatelessWidget {
  var textController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children:
              [
                defaultFormFeild(
                    controller: textController,
                    type: TextInputType.text,
                    validate: (String value){
                      if(value.isEmpty)
                        return 'search must not be empty';
                      else
                        return null;
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    onChanged:(value)
                    {
                      NewsCubit.get(context).getSearch(value);
                    }                ),
                Expanded(child: articleBuilder(list, context,  isSearch: true))
              ],
            ),
          ),
        );
      },
    );
  }
}
