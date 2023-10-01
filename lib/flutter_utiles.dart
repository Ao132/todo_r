import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_r/model/task.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance.collection('task').withConverter<Task>(
        fromFirestore: ((snapshot, options) => Task.fromJson(snapshot.data()!)),
        toFirestore: ((task, options) => task.toJson()));
  }

  static Future<void> addTaskToFireStore(Task task) {
    CollectionReference<Task> taskCollection = getTasksCollection();
    DocumentReference<Task> docRef = taskCollection.doc();
    task.id = docRef.id;
    return docRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task) {
    return getTasksCollection().doc(task.id).delete();
  }

  static Future<void> updateTaskStatusFirebase(Task task, bool newStatus) {
    return getTasksCollection().doc(task.id).update({"isDone": newStatus});
  }
}
