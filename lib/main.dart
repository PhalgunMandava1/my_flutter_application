import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'registration_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final TextEditingController dobController = TextEditingController();
  final TextEditingController fatherController = TextEditingController();
  final TextEditingController motherController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? selectedGender;

  bool reading = false;
  bool traveling = false;
  bool music = false;
  bool sports = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: dobController,
              readOnly: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: "DD/MM/YYYY",
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      dobController.text =
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone Number",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: fatherController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Father Name",
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: motherController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mother Name",
              ),
            ),

            const SizedBox(height: 15),
 
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Gender",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio<String>(
                  value: "Male",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v),
                ),
                const Text("Male"),
                Radio<String>(
                  value: "Female",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v),
                ),
                const Text("Female"),
                Radio<String>(
                  value: "Others",
                  groupValue: selectedGender,
                  onChanged: (v) => setState(() => selectedGender = v),
                ),
                const Text("Others"),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Hobbies",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            CheckboxListTile(
              title: const Text("Reading"),
              value: reading,
              onChanged: (v) => setState(() => reading = v!),
            ),
            CheckboxListTile(
              title: const Text("Traveling"),
              value: traveling,
              onChanged: (v) => setState(() => traveling = v!),
            ),
            CheckboxListTile(
              title: const Text("Music"),
              value: music,
              onChanged: (v) => setState(() => music = v!),
            ),  
            CheckboxListTile(
              title: const Text("Others"),
              value: sports,
              onChanged: (v) => setState(() => sports = v!),
            ),

            const SizedBox(height: 15),
 
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your address",
              ),
            ),

            const SizedBox(height: 25),

            Center(
              child: ElevatedButton(
                onPressed: () {
                  List<String> hobbies = [];
                  if (reading) hobbies.add("Reading");
                  if (traveling) hobbies.add("Traveling");
                  if (music) hobbies.add("Music");
                  if (sports) hobbies.add("Sports");

                  print("Phone: ${phoneController.text}");
                  print("Father: ${fatherController.text}");
                  print("Mother: ${motherController.text}");
                  print("Email: ${emailController.text}");
                  print("Gender: $selectedGender");
                  print("Hobbies: $hobbies");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegistrationForm(),
                    ),
                  );
                },
                child: const Text("Submit"),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}