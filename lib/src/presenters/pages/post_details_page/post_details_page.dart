import 'package:flutter/cupertino.dart';
import 'package:scaped/src/presenters/widgets/post_card.dart';
import 'package:scaped/src/presenters/widgets/scaffold_base.dart';

import '../../../domain/models/post.dart';

class PostDetailsPage extends StatelessWidget {
  final Post post;
  const PostDetailsPage({
    required this.post,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      body: PostCard(
        post: post,
        needTextWrap: false,
      ),
    );
  }
}
