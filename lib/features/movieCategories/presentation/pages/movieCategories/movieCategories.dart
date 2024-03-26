import 'movieCategories.export.dart';

class MovieCategoriesScreen extends ConsumerWidget {
  const MovieCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedGenre = ref.watch(selectedGenreIndex);

    print('Entered movie cat successfully');

    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0).r,
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ).r,
              child: SizedBox(
                height: 40.0.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: GenreInfo.genresData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final genre = GenreInfo.genresData[index];

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              ref.watch(selectedGenreIndex.notifier).state =
                                  index;
                              ref.watch(movieGenreID.notifier).state =
                                  genre['id'];
                              ref.watch(movieGenreType.notifier).state =
                                  genre['name'];
                            },
                            child: AnimatedContainer(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4).r,
                              height: 30.h,
                              width: null,
                              decoration: BoxDecoration(
                                  color: selectedGenre == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(15).r,
                                  border: Border.all(
                                    color: Colors.white,
                                  )),
                              duration: 300.ms,
                              child: Center(
                                child: Text(
                                  genre['name'],
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: fontFamily,
                                    fontWeight: selectedGenre == index
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: selectedGenre == index
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ).animate().fadeIn(
                                begin: 0.5,
                                duration: 1000.ms,
                                curve: Curves.easeInOutCubic),
                          ),
                          Visibility(
                            visible: index != GenreInfo.genresData.length - 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              child: CustomContainer(
                                backgroundColor: Colors.white,
                                height: 2.h,
                                width: 2.w,
                              ).animate().fadeIn(
                                  begin: 0.5,
                                  duration: 1000.ms,
                                  curve: Curves.easeInOutCubic),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ),
            const MoviesByGenre(),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              height: MediaQuery.of(context).size.height / 1.68,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    const PopularMovies(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const NowPlayingMovies(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const TopRatedMovies(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const UpcomingMovies(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const AiringTodayMovies(),
                    SizedBox(
                      height: 5.h,
                    ),
                    const OnTheAirShows()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
