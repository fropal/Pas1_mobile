import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_23/controller/api_controller.dart';
import 'package:pas1_mobile_11pplg2_23/model/api_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseController extends GetxController {
  static Database? _db;
  var savedApi = <ApiModel>[].obs;
  final ApiController teamsController = Get.put(ApiController());

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDB();
    }
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'team_database.db');

    return await openDatabase(
        path,
        version: 1,
        onCreate:(db, version) async {
          await db.execute('''
          CREATE TABLE teams(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            strTeam TEXT,
            strDescriptionEN TEXT,
            strLocation TEXT,
            strBadge TEXT
          )
        ''');
        }
    );
  }

  Future<int> saveApi(ApiModel team) async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized.");
    }

    int result = await dbClient.insert('teams', team.toMap());
    loadSavedApi();
    return result;
  }

  Future<void> loadSavedApi() async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized.");
    }

    List<Map<String, dynamic>> queryResult = await dbClient.query('teams');
    savedApi.assignAll(queryResult.map((data) => ApiModel.fromJson(data)));

    savedApi.forEach((team) => team.isSaved.value = true);
    Set<String> savedTeamNames = savedApi.map((team) => team.strName).toSet();

    for (var team in teamsController.apiList) {
      team.isSaved.value = savedTeamNames.contains(team.strName);
    }
  }

  Future<int> deleteSavedApi(ApiModel team) async {
    var dbClient = await db;
    if (dbClient == null) {
      throw Exception("Database is not initialized");
    }

    int result = await dbClient.delete(
        'teams',
        where: 'strTeam = ?',
        whereArgs: [team.strName]
    );
    loadSavedApi();
    return result;
  }
}