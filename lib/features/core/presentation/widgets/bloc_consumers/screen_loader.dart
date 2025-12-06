import 'package:core_package/core_package.dart';
import 'package:dalil_hama/features/core/presentation/widgets/dialogs/dialog_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class ScreenLoader<T> extends StatefulWidget {
  final BlocBase<BaseState<T>> cubit;
  final bool autoDispose;
  final ValueChanged<T>? onSuccess;
  final ValueChanged<Failure>? onError;
  final Widget? loader;
  final Widget child;
  final bool? isFloating;
  final bool withSuccess;
  final bool? useRoot;

  const ScreenLoader({
    super.key,
    this.autoDispose = true,
    required this.cubit,
    this.loader,
    this.onError,
    this.onSuccess,
    required this.child,
    this.isFloating,
    this.withSuccess = true,
    this.useRoot,
  });

  @override
  State<ScreenLoader<T>> createState() => _ScreenLoaderState<T>();
}

class _ScreenLoaderState<T> extends State<ScreenLoader<T>> {
  @override
  void dispose() {
    super.dispose();
    if (widget.autoDispose) {
      widget.cubit.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.cubit,
      listener: (context, BaseState<T> state) {
        if (state.isInProgress) {
          PopUps(context: context).showLoadingDialog(root: widget.useRoot);
        } else if (state.isSuccess) {
          if (context.canPop()) {
            context.pop();
          }
          widget.onSuccess?.call(state.item as T);
          if (widget.withSuccess) {
            // WidgetsBinding.instance.addPostFrameCallback((e) {
            PopUps(context: context).showSuccessDialog();
            // });
          }
        } else if (state.isFailure) {
          if (context.canPop()) {
            context.pop();
          }
          PopUps(context: context).showFailDialog(
            failure: state.failure,
            isFloating: widget.isFloating ?? false,
          );
          widget.onError?.call(state.failure!);
        } else {}
      },
      child: widget.child,
    );
  }
}
