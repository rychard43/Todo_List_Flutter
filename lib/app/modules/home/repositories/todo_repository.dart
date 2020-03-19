import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rych/app/modules/home/models/todo_model.dart';
import 'package:rych/app/modules/home/repositories/todo_repository_interface.dart';

class TodoRespository implements ITodoRepository {
  final Firestore firestore;

  TodoRespository(this.firestore);

  @override
  Stream<List<TodoModel>> getTodos() {
    return firestore
        .collection("todo")
        .orderBy("position")
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return TodoModel.fromDocument(doc);
      }).toList();
    });
  }
}
