class User {
  final String firstName;
  final String lastName;
  final String password;
  final String email;

  User({
    this.firstName,
    this.lastName,
    this.email,
    this.password
  });

  Map<String,dynamic> toMap(){
    return {
      'first_name' : firstName,
      'last_name' : lastName,
      'password' : password,
      'email' : email
    };
  }
}