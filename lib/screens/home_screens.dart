// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_providers.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cine'),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [CardSwipes(movies: moviesProvider.onDisplayMovies),  MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextpage: () => moviesProvider.getPopularMovies()

           
            )],
          ),
        ));
  }
}
