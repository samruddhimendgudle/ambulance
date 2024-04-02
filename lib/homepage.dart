import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final loc.Location location = loc.Location();
  late Timer _timer; //1
  int d_cnt=0,u_cnt=0;
  StreamSubscription<loc.LocationData>? _locationSubscription;

  //notification
  // NotificationServices notificationServices = NotificationServices();
  //
  // var val;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _requestPermission();
  //   print('requesting for permission....');
  //   // location.changeSettings(interval: 30, accuracy: loc.LocationAccuracy.high);
  //   location.enableBackgroundMode(enable: true);
  //   // _startLocationUpdates(); //2
  //
  // }
  // @override                 //3
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
  // // void _startLocationUpdates() { //4
  // //   const Duration interval = Duration(seconds: 3); // Adjust interval as needed
  // //   _timer = Timer.periodic(interval, (Timer timer) {
  // //     _getLocation();
  // //   });
  // // }
  // _requestPermission() async {
  //   var status = await Permission.location.request();
  //   if (status.isGranted) {
  //     print('done');
  //   } else if (status.isDenied) {
  //     _requestPermission();
  //   } else if (status.isPermanentlyDenied) {
  //     openAppSettings();
  //   }
  // }
  //
  // autheticateDriver() async {
  //   print('logging as driver');
  //   //notification
  //   notificationServices.requestNotificationPermission();
  //   notificationServices.forgroundMessage();
  //   notificationServices.firebaseInit(context);
  //   notificationServices.setupInteractMessage(context);
  //   notificationServices.isTokenRefresh();
  //   notificationServices.getDeviceToken().then((value){
  //     if (kDebugMode) {
  //       print('device token');
  //       print(value);
  //       val=value;
  //     }
  //   });
  //   try {
  //     await Firebase.initializeApp();
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     CollectionReference countCollection = firestore.collection('count');
  //     QuerySnapshot querySnapshot = await countCollection.get();
  //     for (DocumentSnapshot doc in querySnapshot.docs) {
  //       String docId = doc.id;
  //       if (docId == 'Driver_count') {
  //         d_cnt=doc['driver'];
  //       }
  //     }
  //     d_cnt++;
  //     print(' in try$d_cnt');
  //     await FirebaseFirestore.instance.collection('count').doc('Driver_count').set({
  //       'driver' : d_cnt
  //     }, SetOptions(merge: true));
  //     final loc.LocationData _locationResult = await location.getLocation();
  //     await FirebaseFirestore.instance.collection('location').doc('driver'+d_cnt.toString()).set({
  //       'latitude': _locationResult.latitude,
  //       'longitude': _locationResult.longitude,
  //       'token': val,
  //       'booking_status': 'no',
  //       //'booked_by' : '',
  //     }, SetOptions(merge: true));
  //     print(d_cnt);
  //   } catch (e) {
  //     print(e);
  //   }
  //   return d_cnt;
  //
  // } //autheticateDriver
  // autheticateUser() async {
  //   print('logging as User');
  //   try {
  //     await Firebase.initializeApp();
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //     CollectionReference countCollection = firestore.collection('count');
  //     QuerySnapshot querySnapshot = await countCollection.get();
  //     for (DocumentSnapshot doc in querySnapshot.docs) {
  //       String docId = doc.id;
  //       if (docId == 'User_count') {
  //         u_cnt=doc['user'];
  //       }
  //     }
  //     u_cnt++;
  //     print(" autheticating $u_cnt");
  //     await FirebaseFirestore.instance.collection('count').doc('User_count').set({
  //       'user' : u_cnt
  //     }, SetOptions(merge: true));
  //     final loc.LocationData _locationResult = await location.getLocation();
  //     await FirebaseFirestore.instance.collection('location').doc('user'+u_cnt.toString()).set({
  //       'latitude': _locationResult.latitude,
  //       'longitude': _locationResult.longitude,
  //     }, SetOptions(merge: true));
  //   } catch (e) {
  //     print(e);
  //   }
  //   return u_cnt;
  // } //autheticateUser
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Welcome"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/amb.png',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                    onPressed: () async { // Add async keyword here
                      // var d_cnt = await autheticateDriver(); // await the result here
                      // notificationServices.getDeviceToken();
                      // print('successfully logged in');
                      // var driver_id = 'driver$d_cnt';
                      // print(driver_id);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => MyDuty(driver_id)));
                    },
                    child: Text("Log in as Driver", style: TextStyle(color: Colors.white)),
                  ),

                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                      onPressed: () async{
                        // var u_cnt = await autheticateUser();
                        // print('successfully loginned');
                        // var user_id = 'user$u_cnt';
                        // print(u_cnt);
                        // //Navigator.pushNamed(context, 'MyPhone');
                        // // Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneAuth(user_id)));
                      }, child: Text("Log in as User",style: TextStyle(color: Colors.white),))
                ],
              ),
            ]
        ),
      ),
    );
  }

}
