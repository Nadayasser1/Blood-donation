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



  static String sendQuestionsPath ({
    required String q1,
    required String q2,
    required String q3,
    required String q4,
    required String q5,
    required String q6,
    required String q7,
    required String q8,

  }){
    return "$baseUrl/questionResponse?Q1=$q1&Q2=$q2&Q3=$q3&Q4=$q4&Q5=$q5&Q6=$q6&Q7=$q7&Q8=$q8";
  }

  static String addDonationPath({
    required String name,
    required String id,
    required String phone,
    required String birthData,
    required String  donationDate,
    required String  branchName,
    required String  bloodType,
}){
    return "$baseUrl/transactions?PhoneNumber=$phone&HumanName=$name&TransTypeId=1&HumanID=$id&BirthDate=$birthData&UnitNumber=1&BloodType=$bloodType&Notes=None&DonationDate=$donationDate&BranchName=$branchName";
  }
}