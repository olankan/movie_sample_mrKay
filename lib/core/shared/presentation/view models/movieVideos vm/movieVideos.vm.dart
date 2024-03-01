import '../../../domain/models/movieVideos model/movieVideos.model.dart';

class MovieVideoVm {
  final Result? video;

  MovieVideoVm({this.video});

  String? get key {
    // Check if video is null
    if (video == null) {
      return null;
    }

    // Check if video is a trailer and official
    if (video!.type == "Trailer" && video!.official == true) {
      return video!.key;
    } else {
      return null;
    }
  }
}



// import '../../../domain/models/movieVideos model/movieVideos.model.dart';

// class MovieVideoVm {
//   final List<Result?>? video;

//   MovieVideoVm({this.video});

//   String? get key {
//     // Check if video is null or empty
//     if (video == null || video!.isEmpty) {
//       return null;
//     }

//     // Filter for the original trailer
//     var originalTrailer = video!.firstWhere(
//       (video) =>
//           video != null && video.type == "Trailer" && video.official == true,
//       orElse: () => null,
//     );

//     // Check if originalTrailer is null
//     if (originalTrailer == null) {
//       return null;
//     }

//     return originalTrailer.key;
//   }
// }

