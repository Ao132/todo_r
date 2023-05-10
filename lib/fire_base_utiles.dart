import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_r/model/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance
      .collection('task')
      .withConverter(fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!), toFirestore: (task, options) => task.toJson());
}

 Future<void>  addTaskToFireStore(Task task) {
  CollectionReference collection = getTaskCollection();
  DocumentReference docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}
