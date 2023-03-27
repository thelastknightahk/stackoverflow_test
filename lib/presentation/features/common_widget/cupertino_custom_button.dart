 
// import 'package:flutter/material.dart';
// import 'package:sof/core/global/colors/app_colors.dart';
// import 'package:sof/core/global/constants/strings.dart';
// import 'package:sof/core/global/utils/size_config.dart';
// import 'package:sof/data/model/movie_model.dart'; 



// enum ButtonState{ Add, Remove}

// class CustomButton extends StatefulWidget {
//   final Movie movie;
//    final ButtonState state;
//   const CustomButton({Key? key,required this.state,required this.movie}) : super(key: key);

//   @override
//   State<CustomButton> createState() => _CustomButtonState();
// }

// class _CustomButtonState extends State<CustomButton> {

//   Color backgroundColor = Colors.transparent;
//   Color textColoredRemove = Colors.red;
//   Color textColoredAdd = AppColors. backgroundButtonColorAdd;

//   late  String AddText = UiText.buttonBookmarkAdd;
//   late String RemoveText = UiText.buttonBmRemove;
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//      switch(widget.state) {
//        case ButtonState.Add:
//          return Center(
//            child: OutlinedButton(
//                style: OutlinedButton.styleFrom(
//                  backgroundColor: backgroundColor,
//                  side:  BorderSide(width: 1.5, color: AppColors.backgroundButtonColorAdd),
//                  minimumSize: Size(MediaQuery
//                      .of(context)
//                      .size
//                      .width * 0.80, SizeConfig.screenHeight! * 0.06),
//                ),
//                onPressed: () {
//                  setState(() {
//                    backgroundColor = AppColors.backgroundButtonColorAdd;
//                    AddText = UiText.buttonBookmarkAddedToBm;
//                  textColoredAdd = Colors.white;});
                   

//                  print('Add to favorite ');
//                },
//                child:  Text(AddText,
//                  style: TextStyle(color: textColoredAdd, fontSize: 16),)),
//          );
//          break;
//        case ButtonState.Remove:
//          return  Center(
//            child: OutlinedButton(
//                style: OutlinedButton.styleFrom(
//                  backgroundColor: backgroundColor,
//                  side:  BorderSide(width: 1.5, color: AppColors.backgroundButtonColorRemove),
//                  minimumSize: Size(MediaQuery.of(context).size.width * 0.80, SizeConfig.screenHeight! * 0.06),
//                ),
//                onPressed: ()  {
//                  setState(() {
//                    backgroundColor = AppColors.backgroundButtonColorRemove;
//                    RemoveText = UiText.buttonFromBmRemove;
//                  textColoredRemove = Colors.white;});
               

//                  print('Remove from Favorite ');
//                }, child:  Text(RemoveText,style: TextStyle(color: textColoredRemove,fontSize: 16),)),
//          );
//      }


//   }
// }
