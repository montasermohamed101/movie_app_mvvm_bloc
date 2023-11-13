import 'package:flutter/material.dart';
import 'package:movie_app_mvvm/UI/screens/cubit/home_view_model.dart';
import 'package:movie_app_mvvm/UI/screens/movie_details.dart';
import 'package:movie_app_mvvm/UI/widgets/text_widgets/text_desc_widget.dart';
import 'package:movie_app_mvvm/UI/widgets/text_widgets/text_title_widget.dart';

import '../../model/movie_model.dart';

class Header extends StatelessWidget {

  final HomeViewModel viewModel;

  Header({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    Adventure? randomImage = viewModel.getNextRandomImage();
    if (randomImage == null) {
      return const CircularProgressIndicator();
    }
    return SingleChildScrollView(
      child: InkWell(
      onTap: (){
        Navigator.pushNamed(context, MovieDetails.routeName,
        arguments: randomImage,
        );
      },
        child: Stack(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              child: Image.network(randomImage.cover,fit: BoxFit.cover,)),
            Positioned(
              bottom: 0,
              child: Container(
                width: 500,
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0),
                      Colors.black,
                    ]
                  ),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextTitleWidget(
                          title: randomImage.title,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,color: Colors.yellow,),
                          const SizedBox(width: 5),
                          TextDescWidget(title: randomImage.rating.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
