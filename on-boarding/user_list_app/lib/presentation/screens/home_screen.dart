import 'package:flutter/material.dart';
import '../../data/models/user.dart';
import '../../data/repositories/user_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserRepository _userRepository = UserRepository();
  late Future<List<User>> _usersFuture;
  User? _savedUser;

  @override
  void initState() {
    super.initState();
    _usersFuture = _userRepository.getUsers();
    _loadSavedUser();
  }

  Future<void> _loadSavedUser() async {
    final savedUser = await _userRepository.getSavedUser();
    setState(() {
      _savedUser = savedUser;
    });
  }

  Future<void> _saveUser(User user) async {
    await _userRepository.saveUser(user);
    await _loadSavedUser();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Saved ${user.name}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List App'),
      ),
      body: Column(
        children: [
          if (_savedUser != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Last Saved User:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Name: ${_savedUser!.name}'),
                      Text('Email: ${_savedUser!.email}'),
                    ],
                  ),
                ),
              ),
            ),
          Expanded(
            child: FutureBuilder<List<User>>(
              future: _usersFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 48, color: Colors.red),
                        const SizedBox(height: 16),
                        const Text(
                          'Failed to load users',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          snapshot.error.toString(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _usersFuture = _userRepository.getUsers();
                            });
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final user = snapshot.data![index];
                      return ListTile(
                        title: Text(user.name),
                        subtitle: Text(user.email),
                        trailing: IconButton(
                          icon: const Icon(Icons.save),
                          onPressed: () => _saveUser(user),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text('No users found'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
