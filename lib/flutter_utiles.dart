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
}
