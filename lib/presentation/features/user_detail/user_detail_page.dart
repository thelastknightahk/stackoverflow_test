// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:sof/core/global/colors/app_colors.dart';
// import 'package:sof/core/global/utils/size_config.dart';
// import 'package:sof/data/model/item_model.dart';
// import 'package:sof/data/model/user_item_detail_model.dart';
// import 'package:sof/presentation/features/common_widget/user_detail_cart.dart';

// import '../../provider/notifer.dart';

// class UserDetailPage extends ConsumerWidget {
//   final BuildContext? context;
//   final Items userModelData;
//     UserDetailPage({Key? key, required this.userModelData, this.context})
//       : super(key: key);

  
  
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var userItemData = ref.watch(dataProvider).userItemModel;
//      final globalKey = GlobalKey();
//     Future.delayed(const Duration(milliseconds: 1000), () {
//       log("Current State ${globalKey.currentState }");
//        ref.read(dataProvider.notifier).fetchUserDetailData(
//           userId: userModelData.accountId.toString(),
//           startPage: '1',
//           pageSize: '30');
    
//     });

//     return userItemData != null
//         ? _buildDetailPageForMovie(context, userItemData, true,
//             userModelData.displayName!, userModelData.profileImage!)
//         : const Center(
//             child: CircularProgressIndicator(),
//           );
//   }
// }

// /// THis build Method created the MODAl Widget [iOS] page that opens from the bottom.
// ///
// Widget _buildDetailPageForMovie(
//     BuildContext context,
//     UserItemModel userModelData,
//     bool isLoading,
//     String userName,
//     String userImage) {
//   SizeConfig().init(context);
//   return Scaffold(
//     body: SizedBox(
//       height: double.maxFinite,
//       child: Column(
//         //mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: SizeConfig.screenHeight! * 0.05,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: SizeConfig.smallPadding),
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.cancel,
//                       size: SizeConfig.screenHeight! * 0.04,
//                       color: AppColors.inactiveColor,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//           SizedBox(
//             height: SizeConfig.screenHeight! * 0.06,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                       horizontal: SizeConfig.smallPadding,
//                       vertical: SizeConfig.screenHeight! * 0.005),
//                   width: SizeConfig.screenWidth! * 0.12,
//                   decoration: BoxDecoration(
//                     color: AppColors.textColor,
//                     borderRadius: BorderRadius.circular(6),
//                     image: DecorationImage(
//                         image: NetworkImage(userImage), fit: BoxFit.cover),
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: SizeConfig.smallPadding),
//                   child: Text("$userName's  Reputation",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyMedium
//                           ?.copyWith(fontWeight: FontWeight.w800)),
//                 )
//               ],
//             ),
//           ),

//           SizedBox(height: SizeConfig.screenHeight! * 0.01),

//           SizedBox(
//             height: SizeConfig.screenHeight! * 0.7,
//             child: ListView.builder(
//                 itemCount: userModelData.items!.length,
//                 itemBuilder: ((context, index) {
//                   return UserDetailPageWidget(
//                       userModelData: userModelData, index: index);
//                 })),
//           ),

//           const Spacer(flex: 2),
//           //CustomButton(movie: movie,state: movie.isFavorite == 0 ? ButtonState.Remove:ButtonState.Add),
//           const Spacer(flex: 2),
//         ],
//       ),
//     ),
//   );
// }
