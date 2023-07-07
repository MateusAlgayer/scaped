import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: Image.network(
                    post.author.avatar,
                    errorBuilder: (_, __, ___) => const Icon(Icons.person),
                  ),
                ),
                Text(
                  '${post.author.name} ${post.author.lastName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(DateFormat('c/M/y H:m').format(post.createdAt)),
              ],
            ),
          ),
          ListTile(
            title: Text(
              post.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              post.issue,
              maxLines: 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
