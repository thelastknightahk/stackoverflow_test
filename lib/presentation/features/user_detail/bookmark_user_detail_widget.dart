import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:sof/core/global/colors/app_colors.dart'; 
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/data/model/bookmark_model.dart'; 
import 'package:sof/presentation/features/common_widget/user_detail_cart.dart';
import 'package:sof/presentation/provider/user_detail_provider.dart';  
 
import '../../../data/model/user_Item_detail_item_model.dart'; 

Widget bookmarkBuildDetailPageForUserReputation(
   { BuildContext? context,
      BookMarkModel? userBookmarkItem, }) {
  int currentPage = 1;      
  SizeConfig().init(context!); 
  return  SizedBox(
          height: double.maxFinite,
          child: Consumer<UserDetailProvider>(
            builder: (context, itemsProvider, child)  {
              return Column(
         
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60,),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: SizeConfig.smallPadding),
                          child: IconButton(
                            icon: Icon(
                              Icons.cancel,
                              size: SizeConfig.screenHeight! * 0.04,
                              color: AppColors.inactiveColor,
                            ),
                            onPressed: () {
                              Provider.of<UserDetailProvider>(context, listen: false).clearUserStreamData();  
                              Navigator.pop(context);

                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: SizeConfig.smallPadding,
                              vertical: SizeConfig.screenHeight! * 0.005),
                          width: SizeConfig.screenWidth! * 0.12,
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                image: NetworkImage(userBookmarkItem!.profileImage!), fit: BoxFit.cover),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: SizeConfig.smallPadding),
                          child: Text("${userBookmarkItem.displayName!}'s  Reputation",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w800)),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: SizeConfig.screenHeight! * 0.01),
                  SizedBox(
                     height: SizeConfig.screenHeight! * 0.6,
                    child: StreamBuilder<List<Items>>(
                        stream: itemsProvider.getUserReputationListData,
                        builder: (context, snapshot) {
                           if (snapshot.hasData) {
                            final items = snapshot.data!;
                            return SizedBox(
                              height: SizeConfig.screenHeight! * 0.6,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  if ((index+3) > items.length && currentPage<= 25 ) {
                                        currentPage += 1;
                                       Future.delayed(const Duration(milliseconds: 1000),(){ 
                                         
                                        itemsProvider.fetchUserReputationList(startPage: '$currentPage',pageSize: '100', userId: userBookmarkItem.accountId!.toString());
                                    });
                                  
                                  }
                                   return UserDetailPageWidget(
                                  userModelData: items[index], index: index);
                 
                                },
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return const Center(
                              child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator()),
                            );
                          }
                        }),
                  ),
                  // itemData!.isEmpty ? SizedBox(
                  //   height: SizeConfig.screenHeight! * 0.7,
                  //   child: Center(
                  //     child: Text("There is no reputation",
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium
                  //                 ?.copyWith(fontWeight: FontWeight.w800)),
                  //   ),
                  // ) :
                  // SizedBox(
                  //   height: SizeConfig.screenHeight! * 0.7,
                  //   child: ListView.builder(
                  //       itemCount: itemData.length,
                  //       itemBuilder: ((context, index) {
                  //         return UserDetailPageWidget(
                  //             userModelData: userModelData, index: index);
                  //       })),
                  // ),

                  const Spacer(flex: 2),
                  // CustomButton(movie: movie,state: movie.isFavorite == 0 ? ButtonState.Remove:ButtonState.Add),
                  // CustomBookmarkButton(state: FunctionHelper.bookmarkCheck(BookMarkModel(
                  //   accountId: userSofItem.accountId ,
                  //   creationDate: userSofItem.creationDate,
                  //   displayName: userSofItem.displayName,
                  //   location: userSofItem.location,
                  //   profileImage: userSofItem.profileImage ,
                  //   reputation: userSofItem.reputation,
                  //   userId: userSofItem.userId
                  // )) ?   ButtonState.Remove :  ButtonState.Add, userSofItem: userSofItem),
                  // const Spacer(flex: 2),
                ],
              );
            }
          ),
        );
}
