
  import 'package:equatable/equatable.dart';
import 'package:graduation/domain/entities/branches.dart';

class GetBranches extends Equatable{

  final String message;
  final List<Branches> branches;

 const GetBranches({
    required this.message,
    required this.branches,
  });

  @override
  List<Object?> get props => [
    message,
    branches,
  ];
}