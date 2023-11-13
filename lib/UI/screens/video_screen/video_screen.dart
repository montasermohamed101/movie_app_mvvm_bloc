import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_mvvm/UI/screens/video_screen/video_cubit/video_states.dart';
import 'package:movie_app_mvvm/UI/screens/video_screen/video_cubit/video_view_model.dart';

class VideoScreen extends StatelessWidget {
  final String videoUrl;

  VideoScreen({required this.videoUrl});

  VideoViewModel viewModel = VideoViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel..initializeVideo(videoUrl),
      builder: (context, state) {
        if (state is SuccessVideoState) {
          return WillPopScope(
            onWillPop: () async {
              // Dispose of video when the user presses the back button
              viewModel.disposeVideo();
              return true;
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Chewie(
                        controller: viewModel.chewieController!,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
