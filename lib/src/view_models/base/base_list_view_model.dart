import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

abstract class BaseListViewModel extends ChangeNotifier {
  RefreshController refreshController = RefreshController(initialRefresh: false);

  Future<void> onLoading();
  Future<void> onRefresh();
}