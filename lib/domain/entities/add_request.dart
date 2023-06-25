

  import 'package:equatable/equatable.dart';

class AddRequest extends Equatable{

  final String message ;

 const AddRequest({required this.message});

  @override
   List<Object?> get props => [
     message,
  ];
}