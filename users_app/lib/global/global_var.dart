import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String userName = "";
String userPhone = "";
String userEmail = "";
String userID = FirebaseAuth.instance.currentUser!.uid;

String googleMapKey = "AIzaSyALu7f01YdANb9AfiSCq4o59K9n7ey1ubw";
String serverKeyFCM = "key=AAAAkVQz4lE:APA91bFIWkN622rRD7vxt_UD6nsENKAC5SS4oVI1en1-XdkfbgcA98h1BVx4lETYEjH2hG_9_jquMeSrC2a7jZlE_cktvZDXNhu_EMeGG1O2xnm5fkPRfc1-m4XBb2NUxIB4l_I-Pnua";

const CameraPosition googlePlexInitialPosition = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);



