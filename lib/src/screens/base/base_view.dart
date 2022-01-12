import 'package:flutter/material.dart';
import 'package:food_app/src/view_models/base/base_view_model.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T model;
  final Widget Function(
    BuildContext context,
    T value,
    Widget? child
  ) builder;

  const BaseView({ Key? key, required this.model, required this.builder }) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.model;
    currentModel.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(builder: widget.builder)
    );
  }
}