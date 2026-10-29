import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/profile_image_helper.dart';
import '../../../../core/utils/theme/app_palette.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class UpdateProfileAvatar extends StatelessWidget {
  const UpdateProfileAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      buildWhen: (previous, current) {
        return current is UpdateProfilePickImageState ||
            current is UpdateProfileGetSuccessState ||
            current is UpdateProfileSuccessState;
      },
      builder: (context, state) {
        final cubit = context.read<UpdateProfileCubit>();
        final ImageProvider backgroundImage = cubit.image != null
            ? FileImage(cubit.image!)
            : ProfileImageHelper.provider(cubit.profileImage);
        return Stack(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: Colors.transparent,
              backgroundImage: backgroundImage,
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: GestureDetector(
                onTap: () {
                  cubit.pickImage();
                },
                child: Container(
                  height: 35.r,
                  width: 35.r,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colors.primary),
                  child: Icon(Icons.camera_alt_sharp, color: context.colors.onPrimary, size: 20.sp),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
