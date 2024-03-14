import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const apiKey = '1ebedcf519c9ad08ad70e51f8aaa3c15';
const String baseURL = 'https://api.themoviedb.org/3'; 
const discoverMoviesURL =
    '/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc';
const imageURL = 'https://image.tmdb.org/t/p/w500';
const genreURL = 'https://api.themoviedb.org/3/genre/movie/list?language=en';
const apiURL = 'https://api.themoviedb.org/3';
const appendToResponse =
    'alternative_titles,changes,credits,images,keywords,lists,releases,reviews,similar,translations,videos';
const String fontFamily = 'Signika';