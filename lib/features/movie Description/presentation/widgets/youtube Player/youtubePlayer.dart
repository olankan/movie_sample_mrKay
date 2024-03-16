// ignore_for_file: prefer_const_declarations, no_leading_underscores_for_local_identifiers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeTrailerPlayer extends ConsumerWidget {
  const YoutubeTrailerPlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoProvider = ref.watch(movieVideosProvider);

    return videoProvider.when(
      data: (video) {
        final videoKey = video
            .firstWhere(
                (video) => video.type == "Trailer" && video.official == true)
            .key!;

        final videoURL = 'https://www.youtube.com/watch?v=$videoKey';
        final videoID = YoutubePlayer.convertUrlToId(videoURL);

        print('$videoID is a mumu');

        YoutubePlayerController _controller = YoutubePlayerController(
          // initialVideoId: 'mDNmQ4cJiVk',
          initialVideoId: videoID!,
          flags: YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Container(
                  height: 360.h,
                  width: 400.w,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90).r,
                    bottomRight: Radius.circular(90).r,
                  ),
                ),
                child: YoutubePlayer(
                  controller: _controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.redAccent,
                  ),
                  onReady: () {
                    debugPrint('Trailer is ready to play');
                  },
                ),
              ),
            ),
          ],
        );
      },
      loading: () => SizedBox(height: 450.h, width: double.infinity),
      error: (error, stackTrace) => Text('Error: $error'),
    );
  }
}



// Container(
//               height: 450.h,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(90).r,
//                   bottomRight: Radius.circular(90).r,
//                 ),
//               ),