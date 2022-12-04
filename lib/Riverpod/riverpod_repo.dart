

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/news_repository.dart';


var latestNewsRiverpod = FutureProvider((ref) => NewsRepo().latestNewsRepo());
var detailsNewsRiverpod = FutureProviderFamily((ref, arg) => NewsRepo().detailsNewsRepo(arg.toString()));
var newsCategoryRiverpod = FutureProvider((ref) => NewsRepo().newsCategory());
 var categoryNewsListRiverpod = FutureProviderFamily((ref, arg) => NewsRepo().categoryNewsListRepo(arg.toString()));
var getNewsCommentRiverpod = FutureProviderFamily((ref, arg) => NewsRepo().getNewsComment(arg.toString()));
var searchNewsRiverpod = FutureProviderFamily((ref, arg) => NewsRepo().searchNews(arg.toString()));