import 'package:core_package/generated/core_translation/core_translations.dart';
import 'package:dalil_hama/features/core/presentation/cubit/base_states/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownBlocWidget<T> extends StatefulWidget {
  final BlocBase<BaseState<List<T>>> bloc;
  final bool autoDispose;
  final String hint;
  final ValueChanged<T?> onChanged;
  final String Function(T) getValue;
  final VoidCallback callBloc;
  final bool required;
  final T? value;
  final bool Function(T)? filter;
  final bool enabled;

  /// Optional equality comparison (defaults to ==)
  final bool Function(T a, T b)? isSame;

  /// Optional key extractor for deduplication (e.g., (city) => city.id)
  final Object Function(T item)? trackBy;

  const DropDownBlocWidget({
    super.key,
    required this.bloc,
    this.autoDispose = true,
    required this.onChanged,
    required this.hint,
    required this.getValue,
    required this.callBloc,
    this.required = false,
    this.value,
    this.filter,
    this.enabled = true,
    this.isSame,
    this.trackBy,
  });

  @override
  State<DropDownBlocWidget<T>> createState() => _DropDownBlocWidgetState<T>();
}

class _DropDownBlocWidgetState<T> extends State<DropDownBlocWidget<T>> {
  T? value;

  bool _equals(T a, T b) => widget.isSame?.call(a, b) ?? (a == b);

  @override
  void initState() {
    super.initState();
    widget.callBloc();
    value = widget.value;
  }

  @override
  void didUpdateWidget(covariant DropDownBlocWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      value = widget.value;
    }
  }

  List<T> _applyFilter(List<T> data) {
    if (widget.filter != null) {
      return data.where((e) => widget.filter!(e)).toList();
    }
    return data;
  }

  List<T> _dedupe(List<T> items) {
    if (widget.trackBy != null) {
      final seen = <Object?>{};
      final out = <T>[];
      for (final e in items) {
        final key = widget.trackBy!(e);
        if (seen.add(key)) out.add(e);
      }
      return out;
    }
    final set = <T>{};
    final out = <T>[];
    for (final e in items) {
      if (set.add(e)) out.add(e);
    }
    return out;
  }

  T? _findMatchingInstance(List<T> items, T selected) {
    for (final e in items) {
      if (_equals(e, selected)) return e;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocBase<BaseState<List<T>>>, BaseState<List<T>>>(
      bloc: widget.bloc,
      builder: (context, state) {
        final raw = state.item ?? const [];
        final filtered = _applyFilter(raw);
        final items = _dedupe(filtered);

        // Only normalize after data successfully loaded
        T? normalizedValue = value;
        if (state.isSuccess && normalizedValue != null) {
          final match = _findMatchingInstance(items, normalizedValue);
          normalizedValue = match;
        }

        // Keep synced locally
        value = normalizedValue;

        return DropdownButtonFormField<T>(
          decoration: InputDecoration(
            suffixIcon: state.isFailure
                ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: widget.callBloc,
                icon: Icon(
                  Icons.refresh,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            )
                : state.isInProgress
                ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                constraints: BoxConstraints(maxWidth: 4, maxHeight: 4),
              ),
            )
                : null,
          ),
          validator: (c) {
            if ((value == null && widget.required) ||
                (!state.isSuccess && widget.required)) {
              return CoreTranslations.of(context)!.fieldRequiredMessage;
            }
            return null;
          },
          hint: Text(
            state.isFailure ? state.failure!.getError(context) : widget.hint,
          ),
          // Show null value during loading/failure to avoid assertion
          initialValue: state.isSuccess ? value : null,
          items: items
              .map(
                (e) => DropdownMenuItem<T>(
              value: e,
              child: Text(widget.getValue(e)),
            ),
          )
              .toList(),
          onChanged: (widget.enabled && state.isSuccess)
              ? (v) {
            value = v;
            widget.onChanged(v);
            setState(() {});
          }
              : null,
        );
      },
    );
  }
}
