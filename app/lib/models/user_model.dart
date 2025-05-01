class UserModel {
  final String? id;
  final String? userName;
  final String? authProvider;
  final int? coinBalance;
  final String? role;
  final GenInfo? genInfo;
  final Map<String, dynamic>? socialMediaLinks;
  final bool? over18;
  final String? domain;
  final bool? createRappPermission;
  final int? tokens;
  final String? email;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? likes;
  final List<dynamic>? following;
  final List<dynamic>? followers;
  final List<dynamic>? rappAccess;
  final int? loginAttempts;

  UserModel({
    this.id,
    this.userName,
    this.authProvider,
    this.coinBalance,
    this.role,
    this.genInfo,
    this.socialMediaLinks,
    this.over18,
    this.domain,
    this.createRappPermission,
    this.tokens,
    this.email,
    this.createdAt,
    this.updatedAt,
    this.likes,
    this.following,
    this.followers,
    this.rappAccess,
    this.loginAttempts,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['user_name'],
      authProvider: json['AuthProvider'],
      coinBalance: json['coinBalance'],
      role: json['role'],
      genInfo:
          json['genInfo'] != null ? GenInfo.fromJson(json['genInfo']) : null,
      socialMediaLinks:
          json['socialMediaLinks'] != null
              ? Map<String, dynamic>.from(json['socialMediaLinks'])
              : null,
      over18: json['over18'],
      domain: json['domain'],
      createRappPermission: json['createRappPermission'],
      tokens: json['tokens'],
      email: json['email'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      likes: json['likes'] != null ? List<dynamic>.from(json['likes']) : null,
      following:
          json['following'] != null
              ? List<dynamic>.from(json['following'])
              : null,
      followers:
          json['followers'] != null
              ? List<dynamic>.from(json['followers'])
              : null,
      rappAccess:
          json['rappAccess'] != null
              ? List<dynamic>.from(json['rappAccess'])
              : null,
      loginAttempts: json['loginAttempts'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'AuthProvider': authProvider,
      'coinBalance': coinBalance,
      'role': role,
      'genInfo': genInfo?.toJson(),
      'socialMediaLinks': socialMediaLinks,
      'over18': over18,
      'domain': domain,
      'createRappPermission': createRappPermission,
      'tokens': tokens,
      'email': email,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'likes': likes,
      'following': following,
      'followers': followers,
      'rappAccess': rappAccess,
      'loginAttempts': loginAttempts,
    };
  }
}

class GenInfo {
  final List<dynamic>? interests;

  GenInfo({this.interests});

  factory GenInfo.fromJson(Map<String, dynamic> json) {
    return GenInfo(
      interests:
          json['interests'] != null
              ? List<dynamic>.from(json['interests'])
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'interests': interests};
  }
}

UserModel? user = UserModel();
