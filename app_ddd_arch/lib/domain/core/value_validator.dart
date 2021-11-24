import 'package:app_ddd_arch/domain/core/failuers.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailuer<String>, String> validateEmailAdress(String input) {
  const regExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  if (RegExp(regExp).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailuer.invalidEmail(faildValue: input));
  }
}
