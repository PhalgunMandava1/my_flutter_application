import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String? registeredEmail;
String? registeredPassword;

List<Map<String, String>> cartItems = [];
List<Map<String, String>> savedItems = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

//////////////// SPLASH SCREEN //////////////////

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          "Leafy App",
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//////////////// LOGIN PAGE //////////////////

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser() {

    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email and Password cannot be empty")),
      );

    }

    else if (registeredEmail == null) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please register first")),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const RegisterPage()),
        );
      });

    }

    else if (email != registeredEmail || password != registeredPassword) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email or password")),
      );

    }

    else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: loginUser,
              child: const Text("Login"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: const Text("Don't have an account? Register"),
            )
          ],
        ),
      ),
    );
  }
}

//////////////// REGISTER PAGE //////////////////

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void registerUser() {

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Fields cannot be empty")),
      );

      return;
    }

    registeredEmail = emailController.text;
    registeredPassword = passwordController.text;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Register")),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: registerUser,
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}

//////////////// MAIN PAGE //////////////////

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  final pages = const [
    HomeScreen(),
    SearchScreen(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.green,
        showUnselectedLabels: true,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: [

          const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),

          const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search"
          ),

          BottomNavigationBarItem(
            label: "Cart",
            icon: Stack(
              children: [

                const Icon(Icons.shopping_cart),

                if (cartItems.isNotEmpty)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        cartItems.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),

          const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account"
          ),
        ],
      ),
    );
  }
}

//////////////// HOME //////////////////

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget plantCard(
      BuildContext context,
      String name,
      String price,
      ) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
        ],
      ),

      padding: const EdgeInsets.all(10),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Icon(Icons.local_florist,size:60,color:Colors.green),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(price, style: const TextStyle(color: Colors.green)),

          const SizedBox(height: 5),

          ElevatedButton(
            onPressed: () {

              cartItems.add({
                "name": name,
                "price": price,
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("$name added to cart")),
              );
            },

            child: const Text("Add to Cart"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Welcome")),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,

          children: [

            plantCard(context,"Aloe Vera","\$18"),
            plantCard(context,"Snake Plant","\$20"),
            plantCard(context,"Peace Lily","\$22"),
            plantCard(context,"Indoor Palm","\$30"),
            plantCard(context,"Mango Tree","\$25"),
            plantCard(context,"Lemon Tree","\$28"),

          ],
        ),
      ),
    );
  }
}

//////////////// SEARCH //////////////////

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text("Search Page", style: TextStyle(fontSize: 22)),
      ),
    );
  }
}

//////////////// CART //////////////////

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  int getTotal() {

    int total = 0;

    for (var item in cartItems) {
      total += int.parse(item["price"]!.replaceAll("\$", ""));
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("My Cart")),

      body: Column(
        children: [

          Expanded(
            child: cartItems.isEmpty
                ? const Center(
              child: Text(
                "Your Cart is Empty",
                style: TextStyle(fontSize: 22),
              ),
            )
                : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {

                final item = cartItems[index];

                return ListTile(
                  leading: const Icon(Icons.local_florist),
                  title: Text(item["name"]!),
                  subtitle: Text(item["price"]!),

                  trailing: Column(
                    children: [

                      TextButton(
                        onPressed: (){
                          setState(() {
                            savedItems.add(item);
                            cartItems.removeAt(index);
                          });
                        },
                        child: const Text("Save Later"),
                      ),

                      TextButton(
                        onPressed: (){
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                        child: const Text("Remove"),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),

          if(savedItems.isNotEmpty)
            const Divider(),

          if(savedItems.isNotEmpty)
            const Text(
              "Saved For Later",
              style: TextStyle(fontSize:18,fontWeight:FontWeight.bold),
            ),

          if(savedItems.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: savedItems.length,
              itemBuilder: (context,index){

                final item = savedItems[index];

                return ListTile(
                  title: Text(item["name"]!),
                  subtitle: Text(item["price"]!),

                  trailing: TextButton(
                    child: const Text("Move to Cart"),
                    onPressed: (){
                      setState(() {
                        cartItems.add(item);
                        savedItems.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),

          if(cartItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                children: [

                  Text(
                    "Total: \$${getTotal()}",
                    style: const TextStyle(fontSize:20),
                  ),

                  const SizedBox(height:10),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder:(context)=>const PaymentPage()),
                      );
                    },
                    child: const Text("Checkout"),
                  )

                ],
              ),
            )
        ],
      ),
    );
  }
}

//////////////// PAYMENT //////////////////

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  String paymentMethod = "Cash on Delivery";

  void placeOrder(){

    cartItems.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order Placed Successfully")),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder:(context)=>const MainPage()),
          (route)=>false,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize:18,fontWeight:FontWeight.bold),
            ),

            RadioListTile(
              value:"Cash on Delivery",
              groupValue: paymentMethod,
              onChanged:(value){
                setState(() {
                  paymentMethod=value!;
                });
              },
              title: const Text("Cash on Delivery"),
            ),

            RadioListTile(
              value:"UPI",
              groupValue: paymentMethod,
              onChanged:(value){
                setState(() {
                  paymentMethod=value!;
                });
              },
              title: const Text("UPI"),
            ),

            RadioListTile(
              value:"Credit Card",
              groupValue: paymentMethod,
              onChanged:(value){
                setState(() {
                  paymentMethod=value!;
                });
              },
              title: const Text("Credit Card"),
            ),

            const SizedBox(height:30),

            ElevatedButton(
              onPressed: placeOrder,
              child: const Text("Place Order"),
            )

          ],
        ),
      ),
    );
  }
}

//////////////// PROFILE //////////////////

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize:22),
        ),
      ),
    );
  }
}
