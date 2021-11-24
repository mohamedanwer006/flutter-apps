import 'package:app_ddd_arch/domain/auth/auth_failuers.dart';
import 'package:app_ddd_arch/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

// I For Interface

abstract class IAuthFacade {
  //Unit work as a void keyword as void can't use as data type
  Future<Either<AuthFailuers, Unit>> signUpWithEmailAndPassword(
      {@required EmailAdress emailAdress, @required Password password});

  Future<Either<AuthFailuers, Unit>> signInWithEmailAndPassword(
      {@required EmailAdress emailAdress, @required Password password});

  Future<Either<AuthFailuers, Unit>> signInWithGoogle();
}
