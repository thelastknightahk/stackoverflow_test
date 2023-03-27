 

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sof/core/global/constants/strings.dart';
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/presentation/features/common_widget/user_card.dart';
import 'package:sof/presentation/provider/users_provider.dart';

import '../../../data/model/item_model.dart';

class UserListPage extends StatelessWidget {
  UserListPage({
    Key? key,
  }) : super(key: key);

  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text(
            UiText.userTitle,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodyText1?.color),
          ),
        ),
        body: SizedBox(child:
            Consumer<UsersProvider>(builder: (context, itemsProvider, child) {
          return Column(
            children: [
              Expanded(
                  child: StreamBuilder<List<Items>>(
                      stream: itemsProvider.getUserListData,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final items = snapshot.data!;
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              if ((index+3) > items.length && currentPage<= 25 ) {
                                    currentPage += 1;
                                   Future.delayed(const Duration(milliseconds: 1000),(){ 
                                    itemsProvider.setUserNextLoading(true);
                                    itemsProvider.fetchUserList(startPage: '$currentPage',pageSize: '100');
                                });
                              
                              }
                               return UserCard(userModelData: items[index]);
                 
                            },
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
                      })),
              StreamBuilder(
                stream: itemsProvider.getUserNextLoad,
                builder: (context, snapshot) {
                   if (snapshot.hasData) {
                    return snapshot.data! ? SizedBox(
                      width: 50,
                      height: 100,
                      
                      child: Center(child: Container(
                       margin: const EdgeInsets.only(bottom: 45.0),
                      height: 40,
                        child: const CircularProgressIndicator())),
                    ) : Container();
                   }
                  return Container();
                }
              )
            ],
          );
        })));
  }
}
