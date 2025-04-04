import 'package:flutter/material.dart';

import 'asset_image_item.dart';
import 'custom_switcher.dart';
import 'label.dart';

class StateCardRow extends StatefulWidget {
  final String label;
  final String content;
  final String assetsPath;
  final bool initialActive;
  final bool isWorked;
  final ValueChanged<bool> onToggle;

  const StateCardRow({
    super.key,
    required this.label,
    required this.assetsPath,
    required this.initialActive,
    required this.onToggle,
    required this.content,
    required this.isWorked,
  });

  @override
  State<StateCardRow> createState() => _StateCardRowState();
}

class _StateCardRowState extends State<StateCardRow> {
  late bool isActive;
  late bool isMutable;

  @override
  void initState() {
    super.initState();
    isActive = widget.initialActive;
    isMutable = !widget.initialActive;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: !isMutable
                ? const Color(0xFF6B5642).withOpacity(0.6)
                : const Color(0xFF6B5642),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFFA38C68).withOpacity(!isMutable ? 0.6 : 1.0)
                : const Color(0x666B5642).withOpacity(!isMutable ? 0.6 : 1.0),
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AssetImageItem(
                backgroundColor: const Color(0x80D9D9D9),
                imagePath: widget.assetsPath,
                width: 60,
                height: 60,
                borderRadius: 4.0,
              ),
              LabelWidget(
                color:
                    const Color(0xFFD9D9D9).withOpacity(!isMutable ? 0.6 : 1.0),
                text: widget.content,
              ),
              Opacity(
                opacity: isMutable ? 1.0 : 0.6,
                child: IgnorePointer(
                  ignoring: !isMutable || (!widget.isWorked && !isActive),
                  child: CustomSwitcher(
                    initialValue: isActive,
                    onToggle: (value) {
                      setState(() {
                        isActive = value;
                      });
                      widget.onToggle(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
