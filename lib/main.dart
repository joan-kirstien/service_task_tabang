import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized ();

  await Hive.initFlutter();
  await Hive.openBox('services');

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabang App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

//Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _servicesController = TextEditingController();
  final TextEditingController _ratingsController = TextEditingController();

  void _showForm(BuildContext ctx, int? itemKey) async {
    //CHECK THIS PART FOR ERRORS
    showModalBottomSheet(
      context: ctx,
      elevation: 5,
      isScrollControlled: true, 
      builder: (_) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).viewInsets.bottom,
          top: 15,
          left: 15,
          right: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(hintText: 'Phone Number'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _servicesController,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(hintText: 'Services'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _ratingsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: 'Ratings'),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {

                //Clear the text fields
                _nameController.text = '';
                _phoneNumberController.text = '';
                _emailController.text = '';
                _passwordController.text = '';
                _servicesController.text = '';
                _ratingsController.text = '';

                Navigator.of(context).pop(); //Close the bottom sheet
              }, 
              child: Text( 'Create New'),
            ),
          ],
        )
      )
      );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('TABANG'),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => null,
          child: const Icon(Icons.add),
      )
   );
  
  }
}