// import 'package:flutter/material.dart';
// import 'package:sof/core/global/colors/app_colors.dart';
// import 'package:sof/core/global/utils/size_config.dart';
// import 'package:sof/data/model/movie_model.dart';
// import 'package:sof/presentation/features/user_detail/user_detail_page.dart'; 
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// class MovieCard extends StatelessWidget {
//   final Movie movie;
//   const MovieCard({Key? key, required this.movie}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return SizedBox(
//       height: SizeConfig.screenHeight! * 0.12,
//       child: Padding(
//         padding:  EdgeInsets.symmetric(vertical: SizeConfig.smallPadding),
//         child: GestureDetector(
//           onTap: () {
//             // showCupertinoModalBottomSheet(
//             //   /// We set the useRootNavigator to true to remove the [CupertinoBottomBar]
//             //   useRootNavigator: true,
//             //   duration: const Duration(milliseconds: 400),
//             //   context: context,
//             //   builder: (context) =>
//             //       UserDetailPage(context: context, movie: movie),
//             // );
//           },
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 Container(
//                   margin:  EdgeInsets.symmetric(
//                       horizontal: SizeConfig.smallPadding, vertical:
//                   SizeConfig.screenHeight! * 0.005),

//                   width: SizeConfig.screenWidth! * 0.19,
//                   decoration: BoxDecoration(
//                     color: AppColors. textColor,
//                     borderRadius: BorderRadius.circular(10),
//                     image: DecorationImage(
//                         image: NetworkImage(movie.poster!),
//                         fit: BoxFit.cover
//                     ),
//                   ),
//                 ),

//                 //Title Box
//                 Padding(
//                   padding:  EdgeInsets.symmetric(
//                       vertical: SizeConfig.screenHeight! * 0.005),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(_parseListOfGenresIntoString(movie.genres), style: Theme
//                           .of(context)
//                           .textTheme
//                           .caption,),
//                       SizedBox(
//                           height: SizeConfig.screenHeight! * 0.05,
//                           width: SizeConfig.screenWidth! * 0.45,
//                           child: Text(movie.title!, style: Theme.of(context).
//                           textTheme.bodyText1?.copyWith(fontSize:SizeConfig.screenHeight! * 0.018,
//                               fontWeight: FontWeight.w700 ))),
//                       SizedBox(height: SizeConfig.screenHeight! * 0.002),
//                       Container(
//                         margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.02),
//                         height: 1.5,color: AppColors. inactiveColor,width:SizeConfig.screenWidth! * 0.65 ,)
//                     ],
//                   ),
//                 ),
//                 const Spacer(flex: 3),
//                 Icon(Icons.arrow_forward_ios,color: AppColors.inactiveColor),
//                 const Spacer(flex: 1),
//               ]),
//         ),
//       ),


//     );
//   }

//   /// This Functions takes care of parsing the list of
//   /// genres obtained into a string [RegEx] could be used here to
//   /// Refer to documentation if needed.

//   String _parseListOfGenresIntoString(genres) {
//     String result = genres.toString().replaceAll('[','')
//         .replaceAll(']', '').replaceAll(',', ' |');
//     return result;
//   }


// }
