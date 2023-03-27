 

import 'package:flutter/material.dart';
import 'package:sof/core/global/utils/functions.dart';
import 'package:sof/core/global/utils/size_config.dart';
import 'package:sof/data/model/user_Item_detail_item_model.dart';

import 'package:sof/data/model/user_item_detail_model.dart';

class UserDetailPageWidget extends StatelessWidget {
  Items userModelData;
  int index;
    UserDetailPageWidget({
    Key? key,
    required this.userModelData,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                    child: Card(
                      
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                          child: Column(
                      children: [
                          Row(
                            children: [
                              const Icon(Icons.indeterminate_check_box),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth! * 0.4,
                                child: Text(userModelData.postId!.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w700)),
                              ),
                                       const SizedBox(
                                
                              ),
                              const Icon(Icons.star_border_purple500_outlined),
                              
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    color: FunctionHelper.checkColor(
                                                    inputText: userModelData
                                                         
                                                        .reputationHistoryType!
                                                        .toString())
                                                .toString() ==
                                            "Green"
                                        ? Colors.greenAccent
                                        : Colors.redAccent),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                      userModelData .reputationHistoryType!
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                                height: 15,
                              ),
                          Row(
                            children: [
                              const Icon(Icons.calendar_month),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                 width: SizeConfig.screenWidth! * 0.4,
                                child: Text(
                                    FunctionHelper.parseDateTime(userModelData .creationDate!
                                        .toString()),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(fontWeight: FontWeight.w700)),
                              ),
                              const Icon(Icons.cached_rounded),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                  userModelData .reputationChange!
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontWeight: FontWeight.w700)),
                            ],
                          ),
                      ],
                    ),
                        )),
                  );
  }
}
