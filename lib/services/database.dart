
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pr2adminpanel/courses_managment.dart';

class DatabaseServices {

final CollectionReference lessonReference = Firestore.instance.collection('lessonReference');
final CollectionReference videoReference = Firestore.instance.collection('videoReference');
final CollectionReference coursesCollection = Firestore.instance.collection('coursesCollection');



Future createLessons (CollectionReference name,subname,docID,lessonData) async {

  try {
    name.document(docID).collection(subname).add(lessonData);

  }catch(e) {
    e.message;
  } toString();
}

Future createBasics (CollectionReference name,lessonData) async {

  try {
    name.add(lessonData);

  }catch(e) {
    e.message;
  } toString();
}

Future createCourse (CollectionReference name,subname, docID,courseData) async {

  try {
    name.document(docID).collection(subname).add(courseData);

  }catch(e) {
    e.message;
  } toString();
}

  getLessons (CollectionReference name, subname, docID) async {
    return name.document(docID).collection(subname).orderBy('when').snapshots();
}
getBasics (CollectionReference name) async {
  return name.orderBy('when').snapshots();
}
getCourses (CollectionReference name, subname, docID) async {
  return await name.document(docID).collection(subname).orderBy('when').snapshots();
}
Future updateLessons (CollectionReference name,subname,docId,selectedItem, updatedItem) async {
try {
  name.document(docId).collection(subname).document(selectedItem).updateData(updatedItem);
}catch(e) {
  e.message;
} toString();
}
Future updateBasics (CollectionReference name,selectedItem, updatedItem) async {
  try {
    name.document(selectedItem).updateData(updatedItem);
  }catch(e) {
    e.message;
  } toString();
}
Future updateCourse (CollectionReference name,selectedItem, updatedItem) async {
  try {
    name.document(selectedItem).updateData(updatedItem);
  }catch(e) {
    e.message;
  } toString();
}
deleteLesson(CollectionReference name,docId) {
  try {
    name.document(docId).delete();
  }catch(e) {
    e.message;
  } toString();
}
Future uploadVideo(CollectionReference name,subname, docId,  vid, desc) async {
  return await name.document(docId).collection(subname).add({
    'video': vid,
    'description': desc,
    'when': DateTime.now()

  });
}
Future addExample (CollectionReference name,subname, docId,  example1, example2, example1code, example2code) async {
  return await name.document(docId).collection(subname).add({
    'Example1': example1,
    'Example2': example2,
    'Example1Code': example1code,
    'Example2Code': example2code,
    'when': DateTime.now()

  });
}
Future category(CollectionReference name,subname, docId, courseData) async {
  return await name.document(docId).collection(subname).add(courseData);
}
Future uploadAuthorPic(CollectionReference name, submame, docId, thisDoc, pic) async {
  return await name.document(docId).collection(submame).document(thisDoc).updateData({
    'authorPic': pic,

  });
}
}

