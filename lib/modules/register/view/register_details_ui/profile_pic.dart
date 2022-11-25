import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prepowl/_utils/ui_components/bottom_sheet/bottomsheet_ui.dart';

import '../../../../_utils/constants/asset_constants.dart';

import '../../controller/profile_bloc.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.state,
  }) : super(key: key);
  final ProfileState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          state.filepath.path.isEmpty
              ? const CircleAvatar(
                  backgroundImage: AssetImage(Assets.customProfileIcon))
              : CircleAvatar(
                  backgroundImage: FileImage(
                    state.filepath,
                  ),
                ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: IconButton(
                    onPressed: () async {
                      final checkImage =
                          await BottomSheetScreen.showSelectImageBottomSheet(
                              context);
                      context
                          .read<ProfileBloc>()
                          .add(UpdateFilePath(checkImage!));
                      // CustomBottomSheet.getProfilePic(context);
                    },
                    iconSize: 30,
                    icon: const Icon(Icons.camera_alt_rounded)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
