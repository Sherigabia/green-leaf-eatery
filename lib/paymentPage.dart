// import 'package:flutter/material.dart';
// import 'package:flutterwave/flutterwave.dart';

// class MakePayment extends StatefulWidget {
//   const MakePayment({ Key? key }) : super(key: key);

//   @override
//   State<MakePayment> createState() => _MakePaymentState();
// }

// class _MakePaymentState extends State<MakePayment> {

//   //use the currency you would like the user to Pay In, in this case, I used KES currency
//   final String currency = FlutterwaveCurrency.GHS;
//   final formKey = GlobalKey<FormState>();
//   final TextEditingController fullname = TextEditingController();
//   final TextEditingController phone = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController amount = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//   return Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter + Flutterwave'),
//           centerTitle: true,
//         ),
//         body: Padding(
//                 padding: const EdgeInsets.only(top: 10.0),
//        child: Form(
//             key: formKey,
//          child:Column(
//           children: [
//           const Padding(padding: EdgeInsets.all(10.0)),
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: TextFormField(
//               controller: fullname,
//               decoration: const InputDecoration(labelText: "Full Name"),
//                    validator: (value) =>
//                       value!.isNotEmpty? null : "Please fill in Your Name",
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: TextFormField(
//               controller: phone,
//               decoration: const InputDecoration(labelText: "Phone Number"),
//                validator: (value) =>
//                       value!.isNotEmpty? null : "Please fill in Your Phone number",
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: TextFormField(
//               controller: email,
//               decoration: const InputDecoration(labelText: "Email"),
//                 validator: (value) =>
//                       value!.isNotEmpty? null : "Please fill in Your Email",
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(bottom: 10),
//             child: TextFormField(
//               controller: amount,
//               decoration: const InputDecoration(labelText: "Amount"),
//               validator: (value) =>
//                       value!.isNotEmpty? null : "Please fill in the Amount you are Paying",
//                 ),
//           ),
//           ElevatedButton(
//             child: const Text('Pay with Flutterwave'),
//             onPressed: () {

//             },
//           ),
//         ]))));
//   }
// }


//  //Add a method to make the flutter wave payment
//  //This Method includes all the values needed to create the Flutterwave Instance
// void _makeFlutterwavePayment(BuildContext context, String fullname, String phone, String email, String amount) async {
//     try {
//       Flutterwave flutterwave = Flutterwave.forUIPayment(
//           //the first 10 fields below are required/mandatory
//           context: this.context,
//           fullName: fullname,
//           phoneNumber: phone,
//           email: email,
//           amount: amount,
//           //Use your Public and Encription Keys from your Flutterwave account on the dashboard
//           encryptionKey: "Your Encription Key",
//           publicKey: "Your Public Key",
//           currency: currency,
//           txRef: DateTime.now().toIso8601String(),
//           //Setting DebugMode below to true since will be using test mode.
//           //You can set it to false when using production environment.
//           isDebugMode: true,
//           //configure the the type of payments that your business will accept
//           acceptCardPayment: false,
//           acceptUSSDPayment: false,
//           acceptAccountPayment: false,
//           acceptFrancophoneMobileMoney: false,
//           acceptGhanaPayment: false,
//           acceptMpesaPayment: true,
//           acceptRwandaMoneyPayment: false,
//           acceptUgandaPayment: false,
//           acceptZambiaPayment: false
//           );
//     }
//     }