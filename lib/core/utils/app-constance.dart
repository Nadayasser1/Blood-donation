class AppConstance {

  static  const String baseUrl ="https://mobileapp-7fcz.onrender.com";


  static String loginPath ({required String email ,required String password})=>"$baseUrl/login?email=$email&password=$password";


  static  String registerPath({required String id ,required String name ,required String email ,required String password ,required String phone,required String gender,required String birthdate}) =>"$baseUrl/register?id=$id&name=$name&email=$email&password=$password&phone=$phone&gender=$gender&birthdate=$birthdate";


  static String userProfilePath ({required String id})=>"$baseUrl/profile?id=$id";

  static String addRequestPath({
    required name,
    required id,
    required phone,
    required birthDate,
    required unitNumber,
    required bloodType,
    required  reason, }){
    return "$baseUrl/transactions?PhoneNumber=$phone&HumanName=$name&TransTypeId=2&HumanID=$id&BirthDate=$birthDate&UnitNumber=$unitNumber&BloodType=$bloodType&Notes=$reason";

  }

  static String getRequestsPath ({required String id})=>"$baseUrl/getTransactions?HumanID=$id&TransTypeId=2";

}