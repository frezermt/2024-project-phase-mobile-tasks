import 'package:flutter/material.dart';

class FacebookHomePage extends StatelessWidget {
  const FacebookHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('facebook',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.messenger),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Stories section
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/200/300?random=$index'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          if (index == 0)
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.add, color: Colors.white),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Post creator
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://picsum.photos/200?random=100'),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Post options
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.video_call, color: Colors.red),
                  label: const Text('Live'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.photo_library, color: Colors.green),
                  label: const Text('Photo'),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.emoji_emotions, color: Colors.amber),
                  label: const Text('Feeling'),
                ),
              ],
            ),
            const Divider(),
            // Posts
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200?random=${index + 50}'),
                        ),
                        title: Text('User ${index + 1}'),
                        subtitle: Text('${index + 1} hour ago'),
                        trailing: const Icon(Icons.more_horiz),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'This is a sample Facebook post ${index + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        ),
                      ),
                      Image.network(
                        'https://picsum.photos/500/300?random=${index + 100}',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up),
                              label: const Text('Like'),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.comment),
                              label: const Text('Comment'),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.share),
                              label: const Text('Share'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
