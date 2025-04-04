import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shelter_ai/core/theme/app_colors.dart';

import '../../domain/bloc/sound_cubit.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            offset: Offset(3, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: (){
          context.read<SoundCubit>().playButtonClickEffect();
          onPressed();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.buttonText,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
