import 'package:flutter/material.dart';
import 'package:movie_app_mvvm/UI/screens/movie_details.dart';
import 'package:movie_app_mvvm/UI/widgets/text_widgets/text_title_widget.dart';
import '../../model/movie_model.dart';
import '../../utils/strings.dart';

class Genre extends StatelessWidget {
  final String title;
  final List<Adventure> movies;

  Genre({required this.title, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextTitleWidget(title: title),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  var item = movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, MovieDetails.routeName,
                            arguments: item);
                      },
                      child:
                      Image.network(
                        item.cover,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.network(
                            Strings.noImageFound,
                            cacheHeight: 300,
                            cacheWidth: 200,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
