import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipes extends StatelessWidget {
  const CardSwipes({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return  GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                    image: NetworkImage('https://via.placeholder.com/300x400')),
              ),
            );
          },
          itemCount: 10,
          itemWidth: size.width * 0.6,
          itemHeight: size.width * 0.8,
          layout: SwiperLayout.STACK,
        ));
  }
}
