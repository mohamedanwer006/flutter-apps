import 'package:api_tester/model/schema.dart';
import 'package:bloc/bloc.dart';
part 'schema_state.dart';

class SchemaCubit extends Cubit<SchemaState> {
  SchemaCubit() : super(SchemaState());

  void setSchema(Schema schema) {
    emit(SchemaState(schema: schema));
  }
}
