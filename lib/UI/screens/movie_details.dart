import 'package:flutter/material.dart';
import 'package:movie_app_mvvm/UI/screens/video_screen/video_screen.dart';
import 'package:movie_app_mvvm/utils/strings.dart';
import '../../model/movie_model.dart';
import '../widgets/text_widgets/text_desc_widget.dart';
import '../widgets/text_widgets/text_title_widget.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = 'movie_details';

  @override
  Widget build(BuildContext context) {
    var movie = ModalRoute.of(context)!.settings.arguments as Adventure;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 500,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.network(
                          movie.cover,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(Strings.noImageFound,
                              cacheHeight: 300,
                              cacheWidth: 200,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      Positioned.fill(
                        bottom: 0,
                        child: Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                Colors.transparent,
                                Colors.black,
                              ])),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                movie.cover,
                                fit: BoxFit.cover,
                                height: 220,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network(Strings.noImageFound,
                                    cacheHeight: 300,
                                    cacheWidth: 200,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                              TextTitleWidget(
                                title: movie.title,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                  const SizedBox(width: 5),
                                  TextDescWidget(title: movie.rating.toString()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.deepOrange,
                        ),
                        child: MaterialButton(
                          onPressed: () async {

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => VideoScreen(
                                      videoUrl: movie.video,
                                    )));
                          },
                          child: TextTitleWidget(title: "Watch Now"),
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextDescWidget(title:   movie.summary,),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                TextDescWidget(title:"director: ${movie.director}",),
                const SizedBox(height: 15),
              ],
            ),
          ),
          SafeArea(child: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,color: Colors.deepOrange,))),
        ],
      ),
    );
  }
}
