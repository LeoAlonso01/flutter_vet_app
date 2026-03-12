import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = await _initDB('vet_hospital.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );

  }

  Future _createDB(Database db, int version) async {

    await db.execute('''
CREATE TABLE users(
id TEXT PRIMARY KEY,
nombre TEXT,
usuario TEXT,
password TEXT,
rol TEXT
)
''');

    await db.execute('''
CREATE TABLE patients(
id TEXT PRIMARY KEY,
nombre TEXT,
especie TEXT,
raza TEXT,
edad INTEGER,
peso REAL,
propietario TEXT,
telefono TEXT
)
''');

    await db.execute('''
CREATE TABLE visits(
id TEXT PRIMARY KEY,
patient_id TEXT,
fecha TEXT,
motivo TEXT
)
''');

  }

}