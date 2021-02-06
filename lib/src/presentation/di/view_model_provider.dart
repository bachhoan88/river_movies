import 'package:hooks_riverpod/all.dart';
import 'package:river_movies/src/presentation/base/loading_state_view_model.dart';
import 'package:river_movies/src/presentation/ui/detail/detail_view_model.dart';
import 'package:river_movies/src/presentation/ui/home/home_view_model.dart';

final loadingStateProvider = ChangeNotifierProvider(
  (ref) => LoadingStateViewModel(),
);

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>(
  (ref) => HomeViewModel(),
);

final detailViewModelProvider = ChangeNotifierProvider.autoDispose<DetailViewModel>(
  (ref) => DetailViewModel(),
);
