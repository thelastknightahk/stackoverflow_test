 
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';  
import 'package:sof/presentation/features/bookmark/bookmark_page.dart';
import 'package:sof/presentation/features/common_widget/cupertino_bottom_bar.dart';
import 'package:sof/presentation/features/common_widget/tab_item.dart';
import 'package:sof/presentation/features/user_list/user_list_page.dart';
import 'package:sof/presentation/provider/bookmark_provider.dart';
import 'package:sof/presentation/provider/users_provider.dart'; 
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TabItem _currentTab = TabItem.userList;
  
   
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.userList: GlobalKey<NavigatorState>(),
    TabItem.bookmark: GlobalKey<NavigatorState>(), 
  };
 
  Map<TabItem, WidgetBuilder> get widgetBuilders {
    return {
     
       TabItem.userList: (context) =>  UserListPage(),
      TabItem.bookmark: (context) =>   BookMarkPage(), 
    };
  }

   @override
  void initState() { 
    super.initState();
    getUser();
  }

  Future<void> getUser() async{
     Provider.of<UsersProvider>(context, listen: false).fetchUserList(startPage: '1',pageSize: '100');
    //  Future.delayed(const Duration(milliseconds: 2000),(){
    //     Provider.of<BookmarkProvider>(context, listen: false).fetchBookmarkList();
    //  });
    
  }

  @override
  void dispose() { 
    super.dispose();
    Provider.of<UsersProvider>(context, listen: false).dispose();
    
  }

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) { 
      navigatorKeys[tabItem]?.currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentTab = tabItem;
      });
    }
  }  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
      !await navigatorKeys[_currentTab]!.currentState!.maybePop(),
      child: CupertinoHomeScaffold(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
        widgetBuilders: widgetBuilders,
        navigatorKeys: navigatorKeys,
      ),
    );
  }
}