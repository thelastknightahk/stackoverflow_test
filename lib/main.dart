import 'package:flutter/material.dart'; 
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart'; 
import 'package:sof/core/global/routes/routes.dart';
import 'package:sof/core/global/theme/app_theme.dart';
import 'package:sof/data/model/bookmark_model.dart';
import 'package:sof/presentation/provider/bookmark_provider.dart';
import 'package:sof/presentation/provider/user_detail_provider.dart';
import 'package:sof/presentation/provider/users_provider.dart';

import 'core/database/hive_constant.dart';

void main() async {
  
  await Hive.initFlutter(); 
    Hive.registerAdapter(BookMarkModelAdapter());
  await Hive.openBox( dbName);
 runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<UsersProvider>(create: (_) => UsersProvider() ), 
         ChangeNotifierProvider<UserDetailProvider>(create: (_) => UserDetailProvider()), 
          ChangeNotifierProvider<BookmarkProvider>(create: (_) => BookmarkProvider()), 
      ],
      child: MaterialApp.router(
        title: 'SOF',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        routerConfig: Routes.router,
      ),
    );
  }
}
