import 'package:flutter/material.dart';
import 'package:movie_sample/core/shared/presentation/view%20models/movies%20vm/moviesVm.dart';
import 'package:movie_sample/features/movie%20Description/presentation/pages/description.export.dart';

class DescriptionMoviesListViewBuilder extends StatelessWidget {
  const DescriptionMoviesListViewBuilder({
    super.key,
    required this.movies,
  });

  final List<MoviesVm> movies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.0.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) {
            final selectedMovie = movies[index];

            return GestureDetector(
              onTap: () {
                // ref.watch(movieID.notifier).state =
                //     selectedMovie.movieID;
                // ref.watch(onNavigateTo.notifier).state =
                //     'recommendedMovies';
                // ref.watch(movieIndex.notifier).state = index;
                // context.go('/description');
              },
              child: selectedMovie.poster == null
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15).r,
                          height: 180.h,
                          width: 130.w,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Center(
                              child: Icon(Icons.image_not_supported_outlined,
                                  color: Colors.white.withOpacity(0.3),
                                  size: 50)),
                        ).animate().fadeIn(
                            begin: 0.5,
                            duration: 1000.ms,
                            curve: Curves.easeInOutCubic),
                        SizedBox(
                            key: Key(selectedMovie.title),
                            height: 20.h,
                            width: 118.w,
                            child: Center(
                              child: Text(
                                selectedMovie.title,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ).animate().fadeIn(
                                  begin: 0.5,
                                  duration: 500.ms,
                                  curve: Curves.easeInOut),
                            )),
                        SizedBox(
                          height: 5.h,
                        )
                      ],
                    )
                  : Container(
                  
                      margin: EdgeInsets.only(right: 5.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: '$imageURL${selectedMovie.poster}',
                            imageBuilder: (context, image) => Container(
                              height: 180.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                image: DecorationImage(
                                  image: image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Container(
                              height: 180.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                              child: Transform.scale(
                                scale: 1.3,
                                child: Center(
                                    child: CupertinoActivityIndicator(
                                        color: Colors.white.withOpacity(0.8))),
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 180.h,
                              width: 130.w,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15.r),
                              ),
                            ),
                          ).animate().fadeIn(
                              begin: 0.5,
                              duration: 1000.ms,
                              curve: Curves.easeInOutCubic),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 18.r)
                                  .animate()
                                  .fadeIn(
                                      begin: 0.5,
                                      duration: 1000.ms,
                                      curve: Curves.easeInOutCubic),
                              Text(
                                '${selectedMovie.rating.toStringAsFixed(1)}/10',
                                // textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            key: Key(selectedMovie.title),
                            height: 18.h,
                            width: 118.w,
                            child: Text(
                              selectedMovie.title,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: fontFamily,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ).animate().fadeIn(
                                  begin: 0.5,
                                  duration: 500.ms,
                                  curve: Curves.easeInOut,
                                ),
                          ),
                        ],
                      ),
                    ),
            );
          }),
    );
  }
}
