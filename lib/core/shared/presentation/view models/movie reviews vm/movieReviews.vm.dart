import 'package:movie_sample/core/shared/domain/models/movie%20reviews%20model/movieReviews.model.dart';

class MovieReviewsVm {
  final Review? review;
  MovieReviewsVm({this.review});

  String? get authorName {
    return review!.authorDetails!.name!.isEmpty
        ? review!.authorDetails!.username
        : review!.authorDetails!.name;
  }

  String? get reviewDate {
    return review!.updatedAt;
  }

  String? get authorContent {
    return review!.content;
  }

  String? get author {
    return review!.author;
  }

  String? get authorImage {
    return review!.authorDetails!.avatarPath;
  }

  double? get authorRating {
    return review!.authorDetails!.rating;
  }
}
