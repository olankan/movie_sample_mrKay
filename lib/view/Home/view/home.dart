import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/core/coreApi/movieApi.dart';
import 'package:movie_sample/core/res/constants.dart';
import 'package:movie_sample/core/viewModels/movieVm.dart';
import 'package:movie_sample/services/fetchMovieService.dart';
import 'package:movie_sample/view/Home/Widgets/movieListView.dart';
import 'package:redacted/redacted.dart';

import '../Redactive Widgets/homeScreenRedact.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getFetchedMovies();
  }

  final FetchMovieService _fetchMovieService = FetchMovieService();
  List<MovieVm> movie = [];
  bool isLoading = false;
  String? bgImage(String img) => "$imageURL$img";

  late MovieVm selectedMovie;

  Future<void> getFetchedMovies() async {
    // Set isLoading to true when fetching movies
    setState(() {
      isLoading = true;
    });

    var res = await _fetchMovieService.getMovies();

    setState(() {
      movie = res!.results!.map((e) => MovieVm(movie: e)).toList();
      selectedMovie = movie[0];
      isLoading = false; // Set isLoading to false after fetching movies
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        // background poster
        Container(
          constraints: const BoxConstraints.expand(),
          child: CachedNetworkImage(
            imageUrl: isLoading ? '' : imageURL + selectedMovie.poster,
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              child: const Text('loading').redact(
                configuration: RedactedConfiguration(),
              ),
            ),
            errorWidget: (context, url, _) => Container(
              child: const Text('loading').redact(
                configuration: RedactedConfiguration(),
              ),
            ),
          ),
        ),

        // linear background widget
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.bottomCenter,
                begin: Alignment.topCenter,
                colors: [Colors.transparent, Colors.transparent, Colors.black]),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 70.h,
            ),
            Row(
              children: [
                SizedBox(width: 30.w),
                CustomContainer(
                  height: 50.h,
                  width: 50.w,
                  radius: 14.r,
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.white,
                  child: const Icon(
                    Icons.filter_list_rounded,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 15.w),
                CustomContainer(
                  height: 50.h,
                  width: 305.w,
                  radius: 14.r,
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Search Products...',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                          )),
                      SizedBox(width: 50.w),
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 140.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NEW',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  child: CustomContainer(
                    backgroundColor: Colors.white,
                    height: 2.h,
                    width: 2.w,
                  ),
                ),
                Text('MOVIE',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(isLoading ? '' : '${movie.first.title}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomContainer(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    width: 210.w,
                    child: Center(
                      child: Text('POPULAR WITH FRIENDS',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                    ),
                  ),
                  CustomContainer(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: Center(
                        child: Text('15+',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ))),
                  ),
                  CustomContainer(
                    width: 70.w,
                    backgroundColor: Colors.amber[500],
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                          text: '8.7',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '/10',
                              style: TextStyle(
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            )
                          ]),
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(isLoading ? '' : '${movie.first.year.year}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  child: CustomContainer(
                    backgroundColor: Colors.white,
                    height: 2.h,
                    width: 2.w,
                  ),
                ),
                Text('Crime, Drama, Thriller',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                  child: CustomContainer(
                    backgroundColor: Colors.white,
                    height: 2.h,
                    width: 2.w,
                  ),
                ),
                Text('Datasat, Dolby Digital',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomContainer(
              height: 2.h,
              width: 300.w,
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Color(0XFFF10000),
                    Colors.transparent
                  ],
                  stops: [
                    0,
                    0.5,
                    1
                  ]),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomContainer(
              height: 40.h,
              width: 120.w,
              backgroundColor: Color(0XFFF10000),
              child: Center(
                  child: Text('BUY TICKET',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ))),
            ),
            SizedBox(
              height: 70.h,
            ),
            MovieListView(
              movies: movie,
              isLoading: isLoading,
            )
          ],
        ),
      ]),

      /*
       Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              // colorFilter: ColorFilter.mode(Color.fromARGB(255, 243, 236, 236), BlendMode.color),
              image: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg'),
              fit: BoxFit.cover),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black.withOpacity(0.5),
          child: Column(
            children: [
              SizedBox(
                height: 70.h,
              ),
              Row(
                children: [
                  SizedBox(width: 30.w),
                  CustomContainer(
                    height: 50.h,
                    width: 50.w,
                    radius: 14.r,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.white,
                    child: const Icon(
                      Icons.filter_list_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  CustomContainer(
                    height: 50.h,
                    width: 305.w,
                    radius: 14.r,
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Search Products...',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.white,
                            )),
                        SizedBox(width: 50.w),
                        const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 140.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('NEW',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: CustomContainer(
                      backgroundColor: Colors.white,
                      height: 2.h,
                      width: 2.w,
                    ),
                  ),
                  Text('MOVIE',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Text('${movie.first.title}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    )),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      width: 210.w,
                      child: Center(
                        child: Text('POPULAR WITH FRIENDS',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    CustomContainer(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: Center(
                          child: Text('15+',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ))),
                    ),
                    CustomContainer(
                      width: 70.w,
                      backgroundColor: Colors.amber[500],
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                            text: '8.7',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/10',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black,
                                ),
                              )
                            ]),
                      )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${movie.first.year.year}',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: CustomContainer(
                      backgroundColor: Colors.white,
                      height: 2.h,
                      width: 2.w,
                    ),
                  ),
                  Text('Crime, Drama, Thriller',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
                    child: CustomContainer(
                      backgroundColor: Colors.white,
                      height: 2.h,
                      width: 2.w,
                    ),
                  ),
                  Text('Datasat, Dolby Digital',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomContainer(
                height: 2.h,
                width: 300.w,
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Colors.transparent,
                      Color(0XFFF10000),
                      Colors.transparent
                    ],
                    stops: [
                      0,
                      0.5,
                      1
                    ]),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomContainer(
                height: 40.h,
                width: 120.w,
                backgroundColor: Color(0XFFF10000),
                child: Center(
                    child: Text('BUY TICKET',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ))),
              ),
              SizedBox(
                height: 70.h,
              ),
              MovieListView(
                movies: movie,
                isLoading: isLoading,
              )
            ],
          ),
        ),
      ), */
    );
  }
}



   // isLoading
          //     ?
          //         Column(
          //   children: [
          //     HomeScreenRedact(),

          //     isLoading == true
          //         ? Center(
          //             child: CircularProgressIndicator(),
          //           )
          //         : MovieListView(movies: movie)
          //   ],
          // )

          // NetworkImage('$imageURL${movie.first.poster}'