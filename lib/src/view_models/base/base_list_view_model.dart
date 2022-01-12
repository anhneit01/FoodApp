import 'package:food_app/src/view_models/base/base_view_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseListViewModel extends BaseViewModel {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  Future<void> onLoading();
  Future<void> onRefresh();
}