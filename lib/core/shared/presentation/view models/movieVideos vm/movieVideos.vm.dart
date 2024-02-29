import '../../../domain/models/movieVideos model/movieVideos.model.dart';

class MovieVideoVm {
  final Result? video;
  MovieVideoVm({this.video});


String? get id => video!.key!;
}
