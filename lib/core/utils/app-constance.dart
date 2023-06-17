class AppConstance {

  static  const String baseUrl ="https://mobileapp-7fcz.onrender.com";


  static String loginPath ({required String email ,required String password})=>"/login?email=$email&password=$password";


  static  String registerPath({required String id ,required String name ,required String email ,required String password ,required String phone,required String gender,}) =>"/register?id=$id&name=$name&email=$email&password=$password&phone=$phone&gender=gender";

}