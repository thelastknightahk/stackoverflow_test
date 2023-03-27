import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sof/core/global/constants/strings.dart';
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/data/model/bookmark_model.dart';
import 'package:sof/presentation/features/common_widget/bookmark_card.dart'; 
import 'package:sof/presentation/provider/bookmark_provider.dart';   

class BookMarkPage extends StatelessWidget   {
  const BookMarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return   Scaffold(
      appBar: AppBar(
        elevation: 0.5,
           title: Text(UiText.bookmarkTitle, style: TextStyle(color: Theme
                          .of(context)
                          .textTheme
                          .bodyText1
                          ?.color),),
      ),
      body:    SizedBox(
        child: FutureBuilder<List<BookMarkModel>>(
         future: Provider.of<BookmarkProvider>(context).loadBookmarkList(),
          builder: (context, snapshot) { 
            if(snapshot.hasData){
                return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                return BookmarkCard(bookMarkModel: snapshot.data![index]);
            }));
            }
           return Container(
              child: Text('Loading'),
           );
          }
        ),
      )
         );
 
  }
}