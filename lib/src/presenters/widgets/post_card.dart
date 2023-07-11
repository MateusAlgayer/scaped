import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final Function()? onTap;
  final bool needTextWrap;

  const PostCard({
    required this.post,
    this.onTap,
    this.needTextWrap = true,
    super.key,
  });

  Text _getText(String txt) {
    return needTextWrap
        ? Text(
            post.issue,
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          )
        : Text(
            post.issue,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap?.call,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    child: Image.network(
                      post.author.avatar,
                      errorBuilder: (_, __, ___) => const Icon(Icons.person),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${post.author.name} ${post.author.lastName}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(DateFormat('c/M/y HH:mm', 'pt_BR').format(post.updatedAt != null ? post.updatedAt! : post.createdAt)),
                ],
              ),
            ),
            ListTile(
              title: Text(
                post.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: _getText(post.issue),
            ),
          ],
        ),
      ),
    );
  }
}
