import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_mvvm/UI/screens/cubit/home_states.dart';
import 'package:movie_app_mvvm/UI/screens/cubit/home_view_model.dart';
import 'package:movie_app_mvvm/UI/widgets/genre.dart';
import 'package:movie_app_mvvm/UI/widgets/header.dart';

class HomeScreen extends StatelessWidget {

  HomeViewModel viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      bloc: viewModel..getMovies(context),
      listener: (context, state) {
     if(state is ErrorHomeState){
       Center(child: Text(state.message),);
     }
      },
      builder: (context, state) {
        if(state is SuccessHomeState){
          return Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Header(viewModel: viewModel),
                  Genre(title: "Action",movies: viewModel.action),
                  Genre(title: "Drama",movies: viewModel.drama),
                  Genre(title: "Comedy",movies: viewModel.comedy),
                  Genre(title: "Adventure",movies: viewModel.adventure),
                  Genre(title: "Animation",movies: viewModel.animation),
                ],
              ),
            ),
          );
        }else{
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(child: CircularProgressIndicator(),),
          );

        }

      },
    );
  }
}
