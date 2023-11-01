import 'dart:convert';
import 'dart:io';
import 'package:admin_panel/model/menu_model.dart';
import 'package:admin_panel/model/order_model.dart';
import 'package:admin_panel/services/firebase_service/storage_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

sealed class DBService {
  static final db = FirebaseDatabase.instance;

  static Future<List<OrderModel>> sortData(String deta) async {
    try {
      final folder = db.ref("Ordered");
      final event = await folder.orderByChild("deta").equalTo(deta).once();
      final json = jsonDecode(jsonEncode(event.snapshot.value)) as Map;

      return json.values
          .map((e) => OrderModel.fromJson(e as Map<String, Object?>))
          .toList();
    } catch (e) {
      debugPrint("Error Sorting: $e");
      return [];
    }
  }

  /// post
  static Future<bool> uploadProduct(String id, String title, String description,
      String category, double price, File file) async {
    try {
      final folder = db.ref("Menu");
      final child = folder.child(id);
      final String imageUrl = await StoreService.uploadFile(file);
      final product = MenuModel(
          id: id,
          name: title,
          description: description,
          category: category,
          price: price,
          imageUrl: imageUrl);
      await child.set(product.toJson());
      return true;
    } catch (e) {
      debugPrint("DB: $e");
      return false;
    }
  }

  /// order users
  static Future<List<OrderModel>> getOrderUser() async {
    List<OrderModel> items = [];
    Query query = db.ref("Ordered");
    DatabaseEvent event = await query.once();
    var snapshot = event.snapshot;
    for (var child in snapshot.children) {
      var jsonOrder = jsonEncode(child.value);
      Map<String, dynamic> map = jsonDecode(jsonOrder);
      var result = OrderModel(
        id: map["id"] as String,
        name: map["name"] as String,
        email: map["email"] as String,
        phone: map["phone"] as String,
        personCount: map["personCount"] as int,
        deta: map["deta"] as String,
        time: map["time"] as String,
        products: (map["product"] as List)
            .map<OrderModelProduct>(
                (e) => OrderModelProduct.fromJson(e as Map<String, Object?>))
            .toList(),
      );
      items.add(result);
      items.sort((a, b) {
        try {
          DateTime x = DateTime.parse(a.deta).add(Duration(
              hours: int.tryParse(a.time.split(":").first) ?? 0,
              minutes: int.tryParse(a.time.split(":").last) ?? 0));

          DateTime y = DateTime.parse(b.deta).add(Duration(
              hours: int.tryParse(b.time.split(":").first) ?? 0,
              minutes: int.tryParse(b.time.split(":").last) ?? 0));
          return x.compareTo(y);
        } catch (e) {
          return 0;
        }
      });
    }
    return items;
  }

  static Future<bool> orderDelete(String id) async {
    try {
      final fbPost = db.ref("Ordered").child(id);
      await fbPost.remove();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteProduct(String id, String imagePath) async {
    try {
      final fbPost = db.ref("Menu").child(id);
      await StoreService.removeFiles(imagePath);
      await fbPost.remove();
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> updateProduct(
      String id, String name, String desc, double price, File? file) async {
    try {
      final fbPost = db.ref("Menu").child(id);
      await fbPost.update({
        "name": name,
        "description": desc,
        "price": price,
        "imageUrl": file,
      });
      return true;
    } catch (e) {
      debugPrint("DB ERROR: $e");
      return false;
    }
  }

  static Future<List<MenuModel>> getAllMenu() async {
    try {
      final folder = db.ref("Menu");
      final data = await folder.get();
      final json = jsonDecode(jsonEncode(data.value)) as Map;
      return json.values
          .map((e) => MenuModel.fromJson(e as Map<String, Object?>))
          .toList();
    } catch (e) {
      throw Exception("RDTBService => getAllMenu ====> $e");
    }
  }
}
