import 'package:flutter/material.dart';

class DropdownSpinner<T> extends StatefulWidget {
  final List<T> items; // Массив данных
  final T? initialValue; // Начальное значение (опционально)
  final String Function(T) itemLabel; // Функция для отображения текста
  final ValueChanged<T>? onChanged; // Callback при изменении

  const DropdownSpinner({
    super.key,
    required this.items,
    this.initialValue,
    required this.itemLabel,
    this.onChanged,
  });

  @override
  _DropdownSpinnerState<T> createState() => _DropdownSpinnerState<T>();
}

class _DropdownSpinnerState<T> extends State<DropdownSpinner<T>> {
  late T selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue ?? widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEDE0D4), // Светлый бежевый цвет
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<T>(
        dropdownColor: Colors.transparent,
        value: selectedValue,
        icon: const Icon(Icons.arrow_drop_down),
        // Иконка выпадающего списка
        isExpanded: true,
        underline: const SizedBox.shrink(),
        // Растягиваем по ширине родителя
        onChanged: (T? newValue) {
          if (newValue != null) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(newValue);
            }
          }
        },
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFEDE0D4),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                widget.itemLabel(value),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B4F35),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
