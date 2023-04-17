import '../model/errorMessageModel.dart';

const String directory = "https://jackdelivery-full-backend.onrender.com";

List<ErrorMessage> error = [
  ErrorMessage(
      title: "Please Enter a Name",
      subtitle: "Please must provide a name"),
  ErrorMessage(
      title: "Please Enter Cr number",
      subtitle: "Please must provide a name"),
  ErrorMessage(
      title: "Please Enter a valid email",
      subtitle: "Please must provide a valid email"),
  ErrorMessage(
      title: "Phone Number is incorrect",
      subtitle: "Please must provide a valid Phone Number (+923012070920)"),
  ErrorMessage(
      title: "Your password is not valid",
      subtitle: "Password should contain upper,lower,digit and Special character"),

];


RegExp regExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
