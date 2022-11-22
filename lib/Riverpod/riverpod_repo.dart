

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/news_repository.dart';


var latestNewsRiverpod = FutureProvider((ref) => NewsRepo().latestNewsRepo());
var detailsNewsRiverpod = FutureProviderFamily((ref, arg) => NewsRepo().detailsNewsRepo(arg.toString()));
var newsCategoryRiverpod = FutureProvider((ref) => NewsRepo().newsCategory());
// var loginRiverpod = FutureProvider((ref) => NewsRepo().logInRepo(email, password))