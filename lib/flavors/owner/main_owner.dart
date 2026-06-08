import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/core/bloc/bloc_observer.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_setup.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/firebase_options.dart';
import 'package:snap_shot/snap_shot.dart';

void main(List<String> args) async {
  final router = AppRouter(role: Role.owner);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupGetIt(Role.owner);
  await hiveSetup(Role.owner);
  Bloc.observer = MyBlocObserver();
  runApp(SnapShot(router: router.router));
}




    // print('🚀 Starting 12-Month Production Seeding Script...');
    
    // final firestore = FirebaseFirestore.instance;
    //  String statsCollection = CollectionPath.instance.statsData;
    //  String usersCollection = CollectionPath.instance.users;
    //  String ordersCollection = CollectionPath.instance.allOrders;

    // const int targetCountPerCategory = 60; 
    // const int standardYear = 2026;

    // // Real structural mock pools matching your naming schemas
    // final List<String> mockNames = ['Seif Tariq', 'Ahmed Ali', 'Omar Hassan', 'Youssef Amr', 'Mariam Noureldin', 'Sara Mahmoud'];
    // final List<Map<String, dynamic>> mockProductCatalog = [
    //   {'id': 'prod_1', 'title': 'Premium Laptop', 'category': 'Electronics', 'description': 'High performance laptop', 'price': 1200.0, 'thumbnail': 'https://link.com/1', 'rating': 4.8, 'brand': 'BrandX', 'stock': 15},
    //   {'id': 'prod_2', 'title': 'Smartphone Pro', 'category': 'Electronics', 'description': '5G capable flagship phone', 'price': 800.0, 'thumbnail': 'https://link.com/2', 'rating': 4.5, 'brand': 'BrandY', 'stock': 30},
    //   {'id': 'prod_3', 'title': 'Wireless Earbuds', 'category': 'Audio', 'description': 'Active noise cancelling buds', 'price': 150.0, 'thumbnail': 'https://link.com/3', 'rating': 4.2, 'brand': 'BrandZ', 'stock': 50},
    //   {'id': 'prod_4', 'title': 'Mechanical Keyboard', 'category': 'Accessories', 'description': 'RGB clicky switches', 'price': 100.0, 'thumbnail': 'https://link.com/4', 'rating': 4.7, 'brand': 'BrandX', 'stock': 20},
    //   {'id': 'prod_5', 'title': 'UltraWide Monitor', 'category': 'Electronics', 'description': '34-inch curved display', 'price': 450.0, 'thumbnail': 'https://link.com/5', 'rating': 4.6, 'brand': 'BrandY', 'stock': 10},
    // ];

    // print('👥 Seeding $targetCountPerCategory Users...');
    // for (int i = 0; i < targetCountPerCategory; i++) {
    //   // Perfectly spread 5 users into each of the 12 calendar months
    //   int targetMonth = (i % 12) + 1; 
    //   DateTime assignedDate = DateTime(standardYear, targetMonth, (i % 28) + 1);
      
    //   String statsMonthKey = DateFormat('yyyy-MM').format(assignedDate);
    //   String formattedTimestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(assignedDate);
    //   String userId = 'mock_user_$i';

    //   final Map<String, dynamic> mockUserJson = {
    //     'id': userId,
    //   'user_name': "userName",
    //   'email': 'mock_user_$i@gmail.com',
    //   'mobile': "01027870171",
    //   'address': "Madrid",
    //   'customerId': "customerId",
    //   "createdAt": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    //   };

    //   // 1. Save directly into your 'users' collection
    //   await firestore.collection(usersCollection).doc(userId).set(mockUserJson);

    //   // 2. Increment global total and update month history slots safely
    //   await firestore.collection(statsCollection).doc('1').set({
    //     'totalUsers': {
    //       'total': FieldValue.increment(1),
    //       'monthlyHistory': {
    //         statsMonthKey: FieldValue.increment(1),
    //       }
    //     }
    //   }, SetOptions(merge: true));
    // }

    // print('📦 Seeding $targetCountPerCategory Orders...');
    // for (int i = 0; i < targetCountPerCategory; i++) {
    //   int targetMonth = (i % 12) + 1; 
    //   DateTime assignedDate = DateTime(standardYear, targetMonth, (i % 28) + 1);
      
    //   String statsMonthKey = DateFormat('yyyy-MM').format(assignedDate);
    //   String formattedTimestamp = DateFormat('yyyy-MM-dd HH:mm:ss').format(assignedDate);
    //   String orderId = 'mock_order_$i';

    //   // Assemble a single product list item with counter payload for the order
    //   final selectedProduct = mockProductCatalog[i % mockProductCatalog.length];
    //   final List<Map<String, dynamic>> orderProductsList = [
    //     {
    //       ...selectedProduct,
    //       'isFav': false,
    //       'inCart': false,
    //       'counter': (i % 3) + 1, // Randomized quantities bought between 1 and 3
    //     }
    //   ];

    //   // Reconstruct the matching specific user snapshot payload
    //   final Map<String, dynamic> accompanyingUserJson = {
    //     'id': 'mock_user_$i',
    //     'name': mockNames[i % mockNames.length],
    //     'email': 'mockuser$i@snapshot.com',
    //     'role': 'User',
    //     'createdAt': formattedTimestamp,
    //   };

    //   double calculatedCost = (selectedProduct['price'] as double) * ((i % 3) + 1);

    //   // Construct payload matching your OrderModel structure perfectly
    //   final Map<String, dynamic> mockOrderJson = {
    //     "id": orderId,
    //     "products": orderProductsList,
    //     "userData": accompanyingUserJson,
    //     "createdAt": formattedTimestamp, // Uses stable calculated date instead of DateTime.now()
    //     "productsCost": calculatedCost,
    //     "deliveryCost": 50.0,
    //     "status": i % 5 == 0 ? "Pending" : "Completed",
    //     "isPaid": i % 5 != 0,
    //   };

    //   // 1. Save directly into your 'orders' collection
    //   await firestore.collection(ordersCollection).doc(orderId).set(mockOrderJson);

    //   // 2. Increment global order details counters
    //   await firestore.collection(statsCollection).doc('1').set({
    //     'totalOrders': {
    //       'total': FieldValue.increment(1),
    //       'monthlyHistory': {
    //         statsMonthKey: FieldValue.increment(1),
    //       }
    //     }
    //   }, SetOptions(merge: true));
    // }

    // // 3. Overwrite flat totalProducts counter to match catalog volume
    // await firestore.collection(statsCollection).doc('1').update({
    //   'totalProducts': mockProductCatalog.length,
    // });

    // print('✅ Complete! 120 items populated cleanly into Firestore.');





