import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../screens/main/cart/model/cart_entity.dart';

class DbServices{

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'cartItems.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE cartProducts(id INTEGER, name TEXT NOT NULL, mainImg INTEGER NOT NULL, describe TEXT, tradeMark TEXT, price TEXT, priceAfterDiscount TEXT, quantity INTEGER)",
        );
      },
      version: 1,
    );
  }
  Future<int> insertCartItem(CartEntity product) async {
    int result = 0;
    final Database db = await initializeDB();
    if(await checkIfItemExistInDb(product)==false){
       db.insert('cartProducts', product.toJson());
    }
    else{
     product.quantity = product.quantity!+1;
     updateQuantity(product.id!, product);
    }
    return result;
  }

  Future<List<CartEntity>> retrieveCartItems() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('cartProducts');
    return queryResult.map((e) => CartEntity.fromJson(e)).toList();
  }

  Future<bool> checkIfItemExistInDb(CartEntity cartEntity) async{
    final Database db = await initializeDB();
    List<Map> result = await db.rawQuery('SELECT * FROM cartProducts WHERE id=?', [cartEntity.id]);
    print('shaimaa db==== ${result.length}');
    if(result.isNotEmpty ) return true;
    return false;
  }

 Future<void> updateQuantity(int id, CartEntity cartEntity) async{
   final Database db = await initializeDB();
  await db.update(
     'cartProducts',
     cartEntity.toJson(),
     where: 'id = ?',
     whereArgs: [cartEntity.id],
   );
 }
  Future<void> deleteDb() async{
    final Database db = await initializeDB();
    await db.delete(
      'cartProducts',
    );
  }

  Future<void> deleteDbItem(int i) async{
    final Database db = await initializeDB();
    await db.delete(
      'cartProducts',
       where: 'id = ?',
       whereArgs: [i],
    );
  }
}