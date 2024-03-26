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
        // final videoKey2 = video.first.key!;

        final videoURL = 'https://www.youtube.com/watch?v=$videoKey';
        // final videoURL2 = 'https://www.youtube.com/watch?v=$videoKey2';
        final videoID = YoutubePlayer.convertUrlToId(videoURL);
        // final videoID2 = YoutubePlayer.convertUrlToId(videoURL2);
        print('$videoID is a mumu');
        // print('$videoID2 is a mumu');

        YoutubePlayerController _controller = YoutubePlayerController(
          // initialVideoId: 'mDNmQ4cJiVk',
          initialVideoId:
              //  videoID == null || videoID == '' || videoID.isEmpty
              // ?
              videoID!,
          // : videoID2!,
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
                // width: double.infinity,
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

// import 'dart:async';
// import 'dart:isolate';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:movie_sample/features/movieCategories/presentation/providers/individualMovieProviders.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeTrailerPlayer extends ConsumerWidget {
//   const YoutubeTrailerPlayer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final videoProvider = ref.watch(movieVideosProvider);

//     return videoProvider.when(
//       data: (video) {
//         final videoKey = video
//             .firstWhere(
//                 (video) => video.type == "Trailer" && video.official == true)
//             .key!;
//         final videoURL = 'https://www.youtube.com/watch?v=$videoKey';

//         return FutureBuilder<YoutubePlayerController>(
//           future: _initializePlayer(videoURL),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else if (!snapshot.hasData) {
//               return SizedBox(height: 450.h, width: double.infinity);
//             } else {
//               final controller = snapshot.data!;
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 360.h,
//                       width: 400.w,
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.5),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(90).r,
//                           bottomRight: Radius.circular(90).r,
//                         ),
//                       ),
//                       child: YoutubePlayer(
//                         controller: controller,
//                         showVideoProgressIndicator: true,
//                         progressIndicatorColor: Colors.red,
//                         progressColors: const ProgressBarColors(
//                           playedColor: Colors.red,
//                           handleColor: Colors.redAccent,
//                         ),
//                         onReady: () {
//                           debugPrint('Trailer is ready to play');
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               );
//             }
//           },
//         );
//       },
//       loading: () => SizedBox(height: 450.h, width: double.infinity),
//       error: (error, stackTrace) => Text('Error: $error'),
//     );
//   }

//   Future<YoutubePlayerController> _initializePlayer(String videoURL) async {
//     final completer = Completer<YoutubePlayerController>();
//     final receivePort = ReceivePort();
//     final sendPortCompleter = Completer<SendPort>();

//     final isolate = await Isolate.spawn(_isolateEntry, receivePort.sendPort);
//     receivePort.listen((message) {
//       if (message is SendPort) {
//         sendPortCompleter.complete(message);
//       } else if (message is YoutubePlayerController) {
//         completer.complete(message);
//       }
//     });

//     final sendPort = await sendPortCompleter.future;
//     sendPort.send(videoURL);

//     return completer.future;
//   }

//   static void _isolateEntry(SendPort sendPort) {h
//     final receivePort = ReceivePort();
//     sendPort.send(receivePort.sendPort);

//     receivePort.listen((message) {
//       if (message is String) {
//         final videoID = YoutubePlayer.convertUrlToId(message);
//         if (videoID != null && videoID.isNotEmpty) {
//           final controller = YoutubePlayerController(
//             initialVideoId: videoID,
//             flags: YoutubePlayerFlags(
//               autoPlay: false,
//               mute: false,
//             ),
//           );
//           sendPort.send(controller);
//         }
//       }
//     });
//   }
// }
