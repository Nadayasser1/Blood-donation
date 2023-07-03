
  import 'package:equatable/equatable.dart';

class QuestionsForm extends Equatable{

  final String message ;

const  QuestionsForm({required this.message});

  @override
  List<Object?> get props =>[message];
}