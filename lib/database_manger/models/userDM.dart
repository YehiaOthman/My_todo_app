class UserDM {
  static const String collectionName = 'User';
  static UserDM? currentUserId;
  String id;
  String fullName;
  String userName;
  String eMail;

  UserDM({required this.id , required this.fullName ,required this.userName, required this.eMail});

  Map<String , dynamic> toFireStore() =>{
    'id' : id,
    'fullName' : fullName,
    'userName' : userName,
    'email' : eMail
  };
  UserDM.fromFireStore(Map<String , dynamic> data): this(
    id: data['id'],
    fullName: data['fullName'],
    userName: data['userName'],
    eMail: data['email']
  );
}
