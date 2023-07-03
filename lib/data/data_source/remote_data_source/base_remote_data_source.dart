import 'package:graduation/data/models/add_request_model.dart';
import 'package:graduation/data/models/get_requests_model.dart';
import 'package:graduation/data/models/login_model.dart';
import 'package:graduation/data/models/register_model.dart';
import 'package:graduation/data/models/send_questions_model.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';
import 'package:graduation/domain/use_cases/register_use_case.dart';

import '../../../domain/use_cases/send_questions_use_case.dart';
import '../../../domain/use_cases/user_profile_use_case.dart';
import '../../models/user_profile_model.dart';


abstract class BaseRemoteDataSource {

  Future<LoginModel> postLogin(LoginParameters parameters);

  Future<RegisterModel> postRegister(RegisterParameters parameters);

  Future<UserProfileModel> getProfileData(UserProfileParameters parameters);

  Future<AddRequestModel> addRequest(AddRequestParameters parameters);

  Future<GetRequestsModel> getRequests (GetRequestParameters parameters);

  Future<SendQuestionsModel> sendQuestions (SendQuestionsParameters parameters );





}