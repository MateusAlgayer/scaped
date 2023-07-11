import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:scaped/src/config/router/app_router.dart';
import 'package:scaped/src/presenters/cubits/my_posts/my_posts_cubit.dart';
import 'package:scaped/src/presenters/cubits/my_posts/my_posts_state.dart';

import '../../widgets/post_card.dart';
import '../../widgets/scaffold_base.dart';

class MyPostsPage extends StatefulWidget {
  const MyPostsPage({super.key});

  @override
  State<MyPostsPage> createState() => _MyPostsPageState();
}

class _MyPostsPageState extends State<MyPostsPage> {
  @override
  Widget build(BuildContext context) {
    MyPostsCubit cubit = Modular.get<MyPostsCubit>();

    return ScaffoldBase(
      body: BlocBuilder<MyPostsCubit, MyPostsState>(
        bloc: cubit,
        builder: (context, state) => switch (state) {
          LoadingMyPostsState() => const Center(
              child: CircularProgressIndicator(),
            ),
          LoadedMyPostsState() => RefreshIndicator(
              onRefresh: () => cubit.refresh(),
              child: ListView.builder(
                itemCount: state.posts.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.posts.length) {
                    return const Center(
                      child: Text(
                        'Você chegou ao fim da lista para os filtros selecionados',
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else {
                    return PostCard(
                      post: state.posts[index],
                      onTap: () => Modular.to.pushNamed(
                        appRouter.postDetailsRoute,
                        arguments: state.posts[index],
                      ),
                    );
                  }
                },
              ),
            ),
          ErrorMyPostsState() => RefreshIndicator(
              onRefresh: () => cubit.refresh(),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      'Ocorreu um erro ao carregar a lista: ${state.error}',
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
        },
      ),
    );
  }
}
