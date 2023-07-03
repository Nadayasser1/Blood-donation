

  import '../../domain/entities/questions_form.dart';

class SendQuestionsModel extends QuestionsForm {

const  SendQuestionsModel({required super.message});


 factory SendQuestionsModel.fromJson(Map<String,dynamic>json)=>SendQuestionsModel
   (message: json["message"],
 );

}