import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'New',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=10',
              'John Doe',
              'liked your post',
              '2 min ago',
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=11',
              'Jane Smith',
              'commented on your photo',
              '15 min ago',
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=12',
              'Mike Johnson',
              'shared your story',
              '1 hour ago',
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Earlier',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=13',
              'Sarah Williams',
              'tagged you in a post',
              'Yesterday',
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=14',
              'David Brown',
              'sent you a friend request',
              '2 days ago',
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=15',
              'Emma Davis',
              'reacted to your comment',
              '3 days ago',
            ),
            _buildNotificationItem(
              'https://picsum.photos/200?random=16',
              'Robert Wilson',
              'mentioned you in a comment',
              '1 week ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(
      String imageUrl, String name, String action, String time) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: ' $action'),
          ],
        ),
      ),
      subtitle: Text(time),
      trailing: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(
                'https://picsum.photos/100?random=${name.hashCode}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
