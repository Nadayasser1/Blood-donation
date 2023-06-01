

class AppConstance {

  static  const String baseUrl ="http://13.51.254.230:3000";


  static String loginPath ({required String email ,required String password})=>"$baseUrl/login?email=$email&password=$password";


  static  String registerPath({required String id ,required String name ,required String email ,required String password ,required String phone,required String gender,}) =>"$baseUrl/register?id=$id&name=$name&email=$email&password=$password&phone=$phone&gender=gender";

}