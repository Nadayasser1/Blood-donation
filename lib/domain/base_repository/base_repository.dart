import 'package:dartz/dartz.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/entities/add_donation.dart';
import 'package:graduation/domain/entities/add_request.dart';
import 'package:graduation/domain/entities/get-branches.dart';
import 'package:graduation/domain/entities/get_donations.dart';
import 'package:graduation/domain/entities/get_notifications.dart';
import 'package:graduation/domain/entities/get_request.dart';
import 'package:graduation/domain/entities/login.dart';
import 'package:graduation/domain/entities/questions_form.dart';
import 'package:graduation/domain/entities/register.dart';
import 'package:graduation/domain/entities/user_profile.dart';
import 'package:graduation/domain/use_cases/add_donation_use_case.dart';
import 'package:graduation/domain/use_cases/add_request_use_case.dart';
import 'package:graduation/domain/use_cases/get_donation_use_case.dart';
import 'package:graduation/domain/use_cases/get_notifications_use_case.dart';
import 'package:graduation/domain/use_cases/get_request_use_case.dart';
import 'package:graduation/domain/use_cases/login_use_case.dart';

import '../use_cases/register_use_case.dart';
import '../use_cases/send_questions_use_case.dart';
import '../use_cases/user_profile_use_case.dart';

abstract  class BaseRepository{

  Future<Either<Failure,Login>> postLogin(LoginParameters parameters);

  Future<Either<Failure,Register>> postRegister (RegisterParameters parameters);

  Future<Either<Failure,UserProfile>> getProfileData (UserProfileParameters parameters);

  Future<Either<Failure,AddRequest>> addRequest (AddRequestParameters parameters);

  Future<Either<Failure,GetRequest>> getRequests (GetRequestParameters parameters);

  Future<Either<Failure,QuestionsForm>> sendQuestions (SendQuestionsParameters parameters );

  Future<Either<Failure,AddDonation>> addDonation (AddDonationParameters parameters );

  Future<Either<Failure,GetDonations>> getDonations (GetDonationsParameters parameters);

  Future<Either<Failure,GetBranches>> getBranches (NoParameters parameters);

  Future<Either<Failure,GetNotifications>> getNotifications (GetNotificationsParameters parameters);






}