import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../cubits/home/home_cubit.dart';
import '../../cubits/home/home_state.dart';
import '../../widgets/post_card.dart';
import '../../widgets/scaffold_base.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = Modular.get<HomeCubit>();

    return ScaffoldBase(
      drawer: [
        FilledButton.icon(
          onPressed: () {},
          label: const Text('Publicar'),
          icon: const Icon(Icons.add),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          label: const Text('Minhas publicações'),
          icon: const Icon(Icons.article),
        ),
        OutlinedButton.icon(
          onPressed: () => cubit.changeTheme(),
          icon: const Icon(Icons.brightness_high),
          label: const Text('Alterar tema'),
        ),
        OutlinedButton.icon(
          label: const Text('Sair'),
          icon: const Icon(Icons.logout),
          onPressed: () => cubit.logOut(),
        ),
      ],
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: cubit,
        builder: (context, state) => switch (state) {
          LoadingHomeState() => const Center(
              child: CircularProgressIndicator(),
            ),
          LoadedHomeState() => RefreshIndicator(
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
                    return PostCard(post: state.posts[index]);
                  }
                },
              ),
            ),
          ErrorHomeState() => RefreshIndicator(
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
