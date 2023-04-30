import 'package:cachedatawithdio/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Flutter Dio Cache Data with Bloc',
      )),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is HomeSucess){
            return SingleChildScrollView(
              physics:const  ClampingScrollPhysics(),
              child: ListView.builder(
                shrinkWrap: true,
                physics:const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(HomeCubit.get(context)
                        .employerModel
                        .data![index]
                        .employeeName!),
                  );
                },
                itemCount: HomeCubit.get(context).employerModel.data!.length,
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
    );
  }
}
