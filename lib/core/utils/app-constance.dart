class AppConstance {

  static  const String baseUrl ="https://mobileapp-7fcz.onrender.com";


  static String loginPath ({required String email ,required String password})=>"$baseUrl/login?email=$email&password=$password";


  static  String registerPath({required String id ,required String name ,required String email ,required String password ,required String phone,required String gender,required String birthdate}) =>"$baseUrl/register?id=$id&name=$name&email=$email&password=$password&phone=$phone&gender=$gender&birthdate=$birthdate";

}