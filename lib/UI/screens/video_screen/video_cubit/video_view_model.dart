import 'package:chewie/chewie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import 'video_states.dart';

class VideoViewModel extends Cubit<VideoStates> {
  VideoViewModel() : super(InitialVideoState());

  ChewieController? chewieController;
  late VideoPlayerController videoPlayerController;

  Future<void> initializeVideo(String videoUrl,) async {
    emit(LoadingVideoState());

    try {
      videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
      await videoPlayerController.initialize();

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,

      );

      emit(SuccessVideoState());
    } catch (e) {
      emit(ErrorVideoState(message: 'Failed to initialize video.'));
    }
  }
  void disposeVideo() {
    chewieController?.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    emit(InitialVideoState());
  }

  @override
  Future<void> close() {
    disposeVideo();
    return super.close();
  }
}
