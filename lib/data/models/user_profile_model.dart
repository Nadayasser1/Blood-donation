

  import 'package:graduation/data/models/user_profile_data_model.dart';
import 'package:graduation/domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile{

 const UserProfileModel({
   required super.message,
   required super.userProfileData,
 });


 factory UserProfileModel.fromJason(Map<String,dynamic>json)=>UserProfileModel(

     message: json["message"],
     userProfileData: UserProfileDataModel.fromJson(json["user"]),

 );
}