 

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:sof/core/global/colors/app_colors.dart';
import 'package:sof/core/global/utils/functions.dart';
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/data/model/bookmark_model.dart';
import 'package:sof/data/model/item_model.dart';
import 'package:sof/presentation/features/user_detail/bookmark_user_detail_widget.dart';
import 'package:sof/presentation/features/user_detail/user_detail_widget.dart';
import 'package:sof/presentation/provider/user_detail_provider.dart';
 

class BookmarkCard extends StatelessWidget {
  final BookMarkModel bookMarkModel;
  BookmarkCard({Key? key, required this.bookMarkModel}) : super(key: key);
  int apiFirstCall = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: (() { 
       callBottomSheet(context,bookMarkModel);
      }),
      child: SizedBox(
      
        height: SizeConfig.screenHeight! * 0.18,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: SizeConfig.smallPadding),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.smallPadding,
                      vertical: SizeConfig.screenHeight! * 0.005),
                  width: SizeConfig.screenWidth! * 0.19,
                  decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(bookMarkModel.profileImage!),
                        fit: BoxFit.cover),
                  ),
                ),

                //Title Box
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight! * 0.005),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: SizeConfig.screenHeight! * 0.02,
                          width: SizeConfig.screenWidth! * 0.55,
                          child: Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(bookMarkModel.displayName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w700)),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Icon(Icons.star_border_purple500_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            bookMarkModel.reputation == null
                                ? ""
                                : bookMarkModel.reputation.toString(),
                            style: Theme.of(context).textTheme.caption,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(Icons.cake),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            bookMarkModel.creationDate == null
                                ? ""
                                : FunctionHelper.getBirthDateInstead (
                                    bookMarkModel.creationDate.toString()),
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_history),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: SizeConfig.screenWidth! * 0.6 ,
                            
                            child: Text(
                              bookMarkModel.location == null
                                  ? ""
                                  : bookMarkModel.location.toString(),
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: SizeConfig.screenHeight! * 0.002),
                      Container(
                        margin: EdgeInsets.only(
                            left: SizeConfig.screenWidth! * 0.02),
                        height: 1.5,
                        color: AppColors.inactiveColor,
                        width: SizeConfig.screenWidth! * 0.65,
                      )
                    ],
                  ),
                ),

                Icon(Icons.arrow_forward_ios, color: AppColors.inactiveColor),
                const Spacer(flex: 1),
              ]),
        ),
      ),
    );
  }

   callBottomSheet(BuildContext context, BookMarkModel itemData){
    Provider.of<UserDetailProvider>(context, listen: false).fetchUserReputationList(userId:itemData.accountId.toString(), startPage: '1',pageSize: '100' );
       showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child:   bookmarkBuildDetailPageForUserReputation(
                            context: context, 
                            userBookmarkItem: itemData
                        ),
            ),
            );
          },
        );
  }
}
