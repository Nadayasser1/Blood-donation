
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';
import 'package:graduation/domain/entities/questions_form.dart';

import '../../core/base_use_case/base_use_case.dart';

class SendQuestionsUseCase extends BaseUseCase<QuestionsForm,SendQuestionsParameters>{
  final BaseRepository baseRepository;

  SendQuestionsUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, QuestionsForm>> call(SendQuestionsParameters parameters) async{
    return await baseRepository.sendQuestions(parameters);
  }
}




class SendQuestionsParameters extends Equatable{

  final String q1;
  final String q2;
  final String q3;
  final String q4;
  final String q5;
  final String q6;
  final String q7;
  final String q8;

 const SendQuestionsParameters({
   required this.q1,
   required this.q2,
   required this.q3,
   required this.q4,
   required this.q5,
   required this.q6,
   required this.q7,
   required this.q8,
 });

  @override
  List<Object?> get props => [
    q1,
    q2,
    q3,
    q4,
    q5,
    q6,
    q7,
    q8,
  ];


}