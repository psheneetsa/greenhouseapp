class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? dater;


  UserModel({this.uid, this.email, this.firstName, this.dater});

  // receiving data from server
  factory UserModel.fromMap(map) {
    final now = DateTime.now();

    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      dater: map['datereg'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    final now = DateTime.now();
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'datereg' : '${now.year}.${now.month}.${now.day}',
      'greenh' : '',

    };
  }
}
