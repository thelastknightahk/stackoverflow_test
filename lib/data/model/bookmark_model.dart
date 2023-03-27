import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'bookmark_model.g.dart';

@HiveType(typeId: 1)
class BookMarkModel {
  @HiveField(0)
  int? accountId;

  @HiveField(1)
  int? reputation;
  @HiveField(2)
  int? creationDate;

  @HiveField(3)
  int? userId;

  @HiveField(4)
  String? location;

  @HiveField(5)
  String? profileImage;
  @HiveField(6)
  String? displayName;
  BookMarkModel({
    this.accountId,
    this.reputation,
    this.creationDate,
    this.userId,
    this.location,
    this.profileImage,
    this.displayName,
  });

  BookMarkModel copyWith({
    int? accountId,
    int? reputation,
    int? creationDate,
    int? userId,
    String? location,
    String? profileImage,
    String? displayName,
  }) {
    return BookMarkModel(
      accountId: accountId ?? this.accountId,
      reputation: reputation ?? this.reputation,
      creationDate: creationDate ?? this.creationDate,
      userId: userId ?? this.userId,
      location: location ?? this.location,
      profileImage: profileImage ?? this.profileImage,
      displayName: displayName ?? this.displayName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'reputation': reputation,
      'creationDate': creationDate,
      'userId': userId,
      'location': location,
      'profileImage': profileImage,
      'displayName': displayName,
    };
  }

  factory BookMarkModel.fromMap(Map<String, dynamic> map) {
    return BookMarkModel(
      accountId: map['accountId']?.toInt(),
      reputation: map['reputation']?.toInt(),
      creationDate: map['creationDate']?.toInt(),
      userId: map['userId']?.toInt(),
      location: map['location'],
      profileImage: map['profileImage'],
      displayName: map['displayName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BookMarkModel.fromJson(String source) => BookMarkModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BookMarkModel(accountId: $accountId, reputation: $reputation, creationDate: $creationDate, userId: $userId, location: $location, profileImage: $profileImage, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is BookMarkModel &&
      other.accountId == accountId &&
      other.reputation == reputation &&
      other.creationDate == creationDate &&
      other.userId == userId &&
      other.location == location &&
      other.profileImage == profileImage &&
      other.displayName == displayName;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
      reputation.hashCode ^
      creationDate.hashCode ^
      userId.hashCode ^
      location.hashCode ^
      profileImage.hashCode ^
      displayName.hashCode;
  }
}
