

  import 'package:dartz/dartz.dart';
import 'package:graduation/core/base_use_case/base_use_case.dart';
import 'package:graduation/core/error/failure.dart';
import 'package:graduation/domain/base_repository/base_repository.dart';

import '../entities/get-branches.dart';

class GetBranchesUseCase extends BaseUseCase<GetBranches,NoParameters>{
  final BaseRepository baseRepository ;

  GetBranchesUseCase({required this.baseRepository});
  @override
  Future<Either<Failure, GetBranches>> call(NoParameters parameters)async {
   return await baseRepository.getBranches(parameters);
  }
}