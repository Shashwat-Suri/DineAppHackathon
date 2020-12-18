import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

/*This abstract class defines the user type, and manages some JSON to User
* conversions and visa versa*/

class User {
  String uid;
  String email;
  String photoUrl;
  String displayName;
  String bio;
  GeoPoint lastLocation;
  Timestamp lastTime;
  String phone;
  String referralUid;
  String faculty;
  String year;
  String relationshipStatus;
  var interests = new List();
  var favCuisines = new List();
  //create a 2d array to hold the points for each user
  //first column is the userID and second column is the points
  //amount of rows should be equal to the amount of users - 1 (all the other users) for not it is just a growable list
  var points = new List.generate(50, (_) => new List(2), growable: true);


  User({
    @required this.uid,
    @required this.email,
    this.photoUrl,
    @required this.displayName,
    this.bio,
    this.lastLocation,
    this.lastTime,
    this.phone,
    this.faculty,
    this.year,
    this.relationshipStatus,
    this.interests,
    this.favCuisines,
    this.points,
    this.referralUid = "",
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      uid: doc.get('uid'),
      email: doc.get('email'),
      photoUrl: doc.get('photoUrl'),
      displayName: doc.get('displayName'),
      bio: doc.get('bio'),
      lastLocation: doc.get('lastLocation'),
      lastTime: doc.get('lastTime'),
      phone: doc.get('phone'),
      faculty: doc.get('faculty'),
      year: doc.get('year'),
      relationshipStatus: doc.get('relationshipStatus'),
      interests: doc.get('interests'),
      favCuisines: doc.get('favCuisines'),
      points: doc.get('points'),
      referralUid: doc.get('referralUid'),
    );
  }

  Map<String, dynamic> toMap(User user) {
    return {
      'uid': user.uid,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'displayName': user.displayName,
      'bio': user.bio,
      'lastLocation': user.lastLocation,
      'lastTime': user.lastTime,
      'phone': user.phone,
      'faculty' : user.faculty,
      'year' : user.year,
      'relationshipStatus' : user.relationshipStatus,
      'interests' : user.interests,
      'favCuisines' : user.favCuisines,
      'points' : user.points,
      'referralUid': user.referralUid
    };
  }

  User.fromMap(Map<String, dynamic> mapData) {
    uid = mapData['uid'];
    email = mapData['email'];
    photoUrl = mapData['photoUrl'];
    displayName = mapData['displayName'];
    bio = mapData['bio'];
    lastTime = mapData['lastTime'];
    lastLocation = mapData['lastLocation'];
    phone = mapData['phone'];
    faculty = mapData['faculty'];
    year = mapData['year'];
    relationshipStatus = mapData['relationshipStatus'];
    interests = mapData['interests'];
    favCuisines = mapData['favCuisines'];
    points = mapData['points'];
    referralUid = mapData['referralUid'];
  }
}
