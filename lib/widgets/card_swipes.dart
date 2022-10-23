// ignore_for_file: avoid_print

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class CardSwipes extends StatelessWidget {

final List<Movie> movies;

  const CardSwipes({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {

            final movie = movies[index];
            return  GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.fullPosterImg)),
              ),
            );
          },
          itemWidth: size.width * 0.6,
          itemHeight: size.width * 0.8,
          layout: SwiperLayout.STACK,
        ));
  }
}
