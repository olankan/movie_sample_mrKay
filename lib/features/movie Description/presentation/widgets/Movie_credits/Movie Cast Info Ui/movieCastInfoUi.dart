import 'package:flutter/material.dart';
import 'package:movie_sample/features/movie%20Description/presentation/widgets/Movie_credits/MovieCredits_Exports/movieCredits.export.dart';

class MovieCastInfoUi extends ConsumerWidget {
  const MovieCastInfoUi({super.key});



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final movieCastCredit = ref.watch(movieCastCreditsProvider);

         return 
                                  movieCastCredit.when(
                                    data: (credits) {
                                      return credits.isEmpty
                                          ? SizedBox()
                                          : Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                credits.isEmpty
                                                    ? SizedBox()
                                                    : Text(
                                                        'Cast',
                                                        style: TextStyle(
                                                          fontFamily:
                                                              fontFamily,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 20.h,
                                                ),
                                                SizedBox(
                                                  height: 172.h,
                                                  width: double.infinity,
                                                  child: ListView.builder(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          credits.length,
                                                      itemBuilder:
                                                          (BuildContext
                                                                  context,
                                                              int index) {
                                                        final credit =
                                                            credits[index];
                                                        return credit.castPoster ==
                                                                    '' ||
                                                                credit.castPoster ==
                                                                    null
                                                            ? Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            8.0)
                                                                    .r,
                                                                child: Column(
                                                                  children: [
                                                                    CircleAvatar(
                                                                      backgroundColor: Colors
                                                                          .black
                                                                          .withOpacity(0.5),
                                                                      radius:
                                                                          30.r,
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .person_off_rounded,
                                                                        color: Colors
                                                                            .white
                                                                            .withOpacity(0.7),
                                                                        size:
                                                                            35.r,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          120.w,
                                                                      child:
                                                                          Text(
                                                                        credit
                                                                            .castName
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              fontFamily,
                                                                          fontSize:
                                                                              17.sp,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    CastCharacter(
                                                                        credit:
                                                                            credit)
                                                                  ],
                                                                ),
                                                              )
                                                            : Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            8.0)
                                                                    .r,
                                                                child: Column(
                                                                  children: [
                                                                    CachedNetworkImage(
                                                                      imageUrl:
                                                                          '$imageURL${credit.castPoster}',
                                                                      imageBuilder: (context, image) => CircleAvatar(
                                                                          backgroundColor:
                                                                              Colors.black.withOpacity(0.5),
                                                                          radius: 30.r,
                                                                          backgroundImage: image),
                                                                      placeholder:
                                                                          (context, url) =>
                                                                              CircleAvatar(
                                                                        backgroundColor: Colors
                                                                            .black
                                                                            .withOpacity(0.5),
                                                                        radius:
                                                                            30.r,
                                                                        child:
                                                                            Transform.scale(
                                                                          scale:
                                                                              1.3,
                                                                          child:
                                                                              Center(child: CupertinoActivityIndicator(color: Colors.white.withOpacity(0.8))),
                                                                        ),
                                                                      ),
                                                                      errorWidget: (context,
                                                                              url,
                                                                              error) =>
                                                                          CircleAvatar(
                                                                        backgroundColor: Colors
                                                                            .black
                                                                            .withOpacity(0.5),
                                                                        radius:
                                                                            30.r,
                                                                        child:
                                                                            Text('Error: $error'),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          120.w,
                                                                      child:
                                                                          Text(
                                                                        credit
                                                                            .castName
                                                                            .toString(),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              fontFamily,
                                                                          fontSize:
                                                                              17.sp,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    CastCharacter(
                                                                        credit:
                                                                            credit)
                                                                  ],
                                                                ),
                                                              );
                                                      }),
                                                ),
                                              ],
                                            );
                                    },
                                    error: (error, stackTrace) =>
                                        Text('Error: $error'),
                                    loading: () => Center(
                                      child: Transform.scale(
                                        scale: 1.3,
                                        child: SizedBox(
                                          height: 160.h,
                                          child: CupertinoActivityIndicator(
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                      ),
                                    ),
                                  ); }
}