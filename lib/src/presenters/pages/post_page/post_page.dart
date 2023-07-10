import 'package:flutter/material.dart';
import 'package:scaped/src/presenters/widgets/scaffold_base.dart';

import '../../../domain/models/post.dart';

enum ScreenMode { insert, update }

class PostPage extends StatefulWidget {
  final Post? post;
  const PostPage({
    this.post,
    super.key,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  ScreenMode _screenMode = ScreenMode.insert;
  final TextEditingController _titulo = TextEditingController();
  final TextEditingController _publicacao = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (mounted) {
      _titulo.text = widget.post?.title ?? '';
      _publicacao.text = widget.post?.issue ?? '';
      _screenMode = widget.post == null ? ScreenMode.insert : ScreenMode.update;
    }
  }

  @override
  void dispose() {
    _titulo.dispose();
    _publicacao.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldBase(
      body: Form(
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Título'),
                  ),
                  controller: _titulo,
                ),
                const SizedBox(height: 4),
                const Text('Publicação'),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 100,
                    controller: _publicacao,
                  ),
                ),
                const SizedBox(height: 4),
                FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.check),
                  label: const Text('Publicar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
