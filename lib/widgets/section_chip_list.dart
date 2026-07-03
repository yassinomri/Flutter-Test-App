import 'package:flutter/material.dart';
import '../models/section.dart';

class SectionChipList extends StatelessWidget {
  final List<Section> sections;
  final String selectedLabel;
  final ValueChanged<String> onSelected;

  const SectionChipList({
    super.key,
    required this.sections,
    required this.selectedLabel,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final labels = ['Tous', ...sections.map((s) => s.label)];
    final chipKeys = List.generate(labels.length, (_) => GlobalKey());

    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final label = labels[index];
          final isSelected = label == selectedLabel;

          return ChoiceChip(
            key: chipKeys[index],
            label: Text(label),
            selected: isSelected,
            onSelected: (_) {
              onSelected(label);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                final ctx = chipKeys[index].currentContext;
                if (ctx != null) {
                  Scrollable.ensureVisible(
                    ctx,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    alignment: 0.5,
                  );
                }
              });
            },
            backgroundColor: const Color(0xFFEDF1F9),
            selectedColor: const Color(0xFF0B3D91),
            checkmarkColor: Colors.white,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF0B3D91),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide.none,
            ),
          );
        },
      ),
    );
  }
}