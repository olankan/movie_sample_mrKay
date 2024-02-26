import '../movie reviews model/movieReviews.model.dart';

class MovieReviewsVm {
  final Result? review;
  MovieReviewsVm({this.review});

  String get authorName {
    return review!.authorDetails!.name!.isEmpty
        ? review!.authorDetails!.username!
        : review!.authorDetails!.name!;
  }

  DateTime get reviewDate {
    return review!.updatedAt!;
  }

  String get authorContent {
    return review!.content!;
  }

  String get authorImage {
    return review!.authorDetails!.avatarPath!;
  }

  int get rating {
    return review!.authorDetails!.rating!;
  }


}
