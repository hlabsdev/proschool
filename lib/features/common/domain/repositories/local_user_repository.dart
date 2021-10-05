import 'package:proschool/features/common/domain/entities/local_user_entity.dart';
import 'package:proschool/helpers/base_repository.dart';
import 'package:proschool/helpers/database_helper.dart';
import 'package:proschool/helpers/helpers_utils.dart';

class LocalUserRepository extends BaseRepository<LocalUserEntity, int> {
  LocalUserRepository() : super(TABLE_NAME_USER);

  @override
  LocalUserEntity getEntity() {
    return LocalUserEntity();
  }

  Future<List<LocalUserEntity>> existUser(int idUser) async {
    var dbClient = await DatabaseHelper.database;
    final sql = '''SELECT * FROM $TABLE_NAME_USER where  $idUser=$idUser ''';
    final data = await dbClient.rawQuery(sql);

    return List.generate(data.length, (i) {
      return getEntity().fromDatabase(data[i]);
    });
  }

  Future<List<LocalUserEntity>> allUser(int id) async {
    var dbClient = await DatabaseHelper.database;
    String sql = "";
    sql =
        '''SELECT * FROM $TABLE_NAME_USER where $TABLE_NAME_USER.$idUser=$id  order by $idUser desc ''';
    final data = await dbClient.rawQuery(sql);

    return List.generate(data.length, (i) {
      return getEntity().fromDatabase(data[i]);
    });
  }
}
