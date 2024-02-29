// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_sample/features/movie%20Description/presentation/providers/movieDescriptionProviders.dart';
import '../../../../../core/resources/constants.dart';
import '../../widgets/arrowBackButton/arrowBackButton.dart';
import '../../widgets/glassmorphicBackground/glassmorphicBackground.dart';

class MovieDescription extends ConsumerWidget {
  const MovieDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.read(descriptionProvider.notifier).state;

    // final currentMovieIndex = ref.watch(movieIndex);

    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '$imageURL${movies.poster}',
              imageBuilder: (context, image) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) => Container(
                decoration: BoxDecoration(
                  color: Colors.black54,
                ),
                child: Transform.scale(
                  scale: 1.3,
                  child: const Center(
                      child: CupertinoActivityIndicator(color: Colors.red)),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
            ),
            GlassmorphicBackground(movies: movies),
            ArrowBackButton(),
          ],
        ));
  }
}
