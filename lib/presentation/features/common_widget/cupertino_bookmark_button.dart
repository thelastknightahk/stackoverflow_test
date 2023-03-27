import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sof/core/global/colors/app_colors.dart';
import 'package:sof/core/global/constants/strings.dart';
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/data/model/bookmark_model.dart';
import 'package:sof/presentation/provider/bookmark_provider.dart';
import '../../../core/database/hive_constant.dart';
import '../../../data/model/item_model.dart' as item;

enum ButtonState { Add, Remove }

class CustomBookmarkButton extends StatefulWidget {
  final item.Items? userSofItem;
  final ButtonState state;
  const CustomBookmarkButton(
      {Key? key, required this.state, required this.userSofItem})
      : super(key: key);

  @override
  State<CustomBookmarkButton> createState() => _CustomBookmarkButtonState();
}

class _CustomBookmarkButtonState extends State<CustomBookmarkButton> {
  Color backgroundColor = Colors.transparent;
  Color textColoredRemove = Colors.red;
  Color textColoredAdd = AppColors.backgroundButtonColorAdd;

  late String AddText = UiText.buttonBookmarkAdd;
  late String RemoveText = UiText.buttonBmRemove;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    switch (widget.state) {
      case ButtonState.Add:
        return Center(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: backgroundColor,
                side: BorderSide(
                    width: 1.5, color: AppColors.backgroundButtonColorAdd),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.80,
                    SizeConfig.screenHeight! * 0.06),
              ),
              onPressed: () {
                setState(() {
                  backgroundColor = AppColors.backgroundButtonColorAdd;
                  AddText = UiText.buttonBookmarkAddedToBm;
                  textColoredAdd = Colors.white;
                });
                Provider.of<BookmarkProvider>(context, listen: false)
                    .addBookmark(BookMarkModel(
                        accountId: widget.userSofItem!.accountId,
                        creationDate: widget.userSofItem!.creationDate,
                        displayName: widget.userSofItem!.displayName,
                        location: widget.userSofItem!.location,
                        profileImage: widget.userSofItem!.profileImage,
                        reputation: widget.userSofItem!.reputation,
                        userId: widget.userSofItem!.userId));

                 
              },
              child: Text(
                AddText,
                style: TextStyle(color: textColoredAdd, fontSize: 16),
              )),
        );

      case ButtonState.Remove:
        return Center(
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: backgroundColor,
                side: BorderSide(
                    width: 1.5, color: AppColors.backgroundButtonColorRemove),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.80,
                    SizeConfig.screenHeight! * 0.06),
              ),
              onPressed: () {
                setState(() {
                  backgroundColor = AppColors.backgroundButtonColorRemove;
                  RemoveText = UiText.buttonFromBmRemove;
                  textColoredRemove = Colors.white;
                });

                  Provider.of<BookmarkProvider>(context, listen: false)
                    .removeBookmark(BookMarkModel(
                        accountId: widget.userSofItem!.accountId,
                        creationDate: widget.userSofItem!.creationDate,
                        displayName: widget.userSofItem!.displayName,
                        location: widget.userSofItem!.location,
                        profileImage: widget.userSofItem!.profileImage,
                        reputation: widget.userSofItem!.reputation,
                        userId: widget.userSofItem!.userId));

                print('Remove from Favorite ');
              },
              child: Text(
                RemoveText,
                style: TextStyle(color: textColoredRemove, fontSize: 16),
              )),
        );
    }
  }

   
}
