import 'package:dalil_hama/features/services/domain/entity/service.dart';
import 'package:dalil_hama/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ServiceChipList extends StatefulWidget {
  final List<KService> services;
  final Function(KService service) onChange;
  const ServiceChipList({
    super.key,
    required this.services,
    required this.onChange,
  });

  @override
  State<ServiceChipList> createState() => _ServiceChipListState();
}

class _ServiceChipListState extends State<ServiceChipList> {
  KService? selectedService;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final service = widget.services[index];
          return ChoiceChip(
            checkmarkColor: Theme.of(context).primaryColor,
            label: Text(service.title),
            selected: selectedService == service,
            onSelected: (selected) {
              if (selected) {
                selectedService = service;
                widget.onChange(service);
                setState(() {});
              }
            },

            selectedColor: Theme.of(
              context,
            ).appSchema.shapeColor.selectedChipColor,
            backgroundColor: Theme.of(
              context,
            ).appSchema.shapeColor.unSelectedChipColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 8),
        itemCount: widget.services.length,
      ),
    );
  }
}
