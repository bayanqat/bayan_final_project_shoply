import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/images/app_images.dart';
import '../../../../../core/utils/theme/app_palette.dart';
import '../bloc/cubit.dart';
import '../bloc/state.dart';

class SingupHeader extends StatelessWidget {
  const SingupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Join us and start shopping',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: context.colors.textSecondary,
          ),
        ),
        SizedBox(height: 20),
        BlocBuilder<SignupCubit, SignupState>(
          buildWhen: (previous, current) {
            return current is SingupPickImageState || current is SingupRemoveImageState;
          },
          builder: (context, state) {
            final cubit = context.read<SignupCubit>();
            return Stack(
              alignment: AlignmentGeometry.center,
              children: [
                CircleAvatar(
                  radius: 60.h,
                  backgroundColor: Colors.transparent,
                  backgroundImage: cubit.image == null || (cubit.image?.path.isEmpty ?? true)
                      ? AssetImage(AppImages.profilePicture)
                      : FileImage(cubit.image!),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      cubit.pickImage();
                    },
                    child: Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: context.colors.primary,
                      ),
                      child: Icon(
                        Icons.camera_alt_sharp,
                        color: context.colors.onPrimary,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
                cubit.image == null || (cubit.image?.path.isEmpty ?? true)
                    ? SizedBox.shrink()
                    : Positioned(
                        bottom: 5,
                        left: 5,
                        child: GestureDetector(
                          onTap: () {
                            cubit.deleteImage();
                          },
                          child: Container(
                            height: 35.h,
                            width: 35.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colors.error,
                            ),
                            child: Icon(Icons.delete, color: context.colors.onError, size: 20.sp),
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ],
    );
  }
}
