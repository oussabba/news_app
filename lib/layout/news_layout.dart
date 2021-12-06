import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          builder: (context, state) {
            NewsCubit cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text('News app'),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.business),
                    label: 'Business',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports),
                    label: 'Sports',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.science),
                    label: 'Sciences',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
            );
          },
          listener: (context, state) {}),
    );
  }
}
