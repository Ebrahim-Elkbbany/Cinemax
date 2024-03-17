class RegisterRequestModel{
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterRequestModel({required this.firstName, required this.lastName, required this.email, required this.password, required this.confirmPassword});

 toJson(){
     return {
       'firstName' : firstName,
       'lastName': lastName,
       'email' : email,
       'password': password,
       'confirmPassword' :confirmPassword
     };
  }


  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => RegisterRequestModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
  );
}