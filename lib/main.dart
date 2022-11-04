import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete_guide/sections/cart/home_cart_screen.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/bloc/counter_bloc.dart';
import 'package:flutter_complete_guide/sections/counter_bloc/counter_bloc_screen.dart';
import 'package:flutter_complete_guide/sections/book_cart/providers/books_provider.dart';
import 'package:flutter_complete_guide/sections/book_cart/screens/books_grid_screen.dart';
import 'package:flutter_complete_guide/sections/counter/counter_screen.dart';
import 'package:flutter_complete_guide/sections/counter/providers/counter.dart';
import 'package:flutter_complete_guide/sections/counter_cubit/counter_cubit_screen.dart';
import 'package:flutter_complete_guide/sections/counter_cubit/cubit/counter_cubit.dart';
import 'package:flutter_complete_guide/sections/material_design/appbar_screen.dart';
import 'package:flutter_complete_guide/sections/material_design/bottom_bar_screen.dart';
import 'package:flutter_complete_guide/sections/material_state/material_state_screen.dart';
import 'package:flutter_complete_guide/sections/navigation/first_screen.dart';
import 'package:flutter_complete_guide/sections/navigation/home_screen.dart';
import 'package:flutter_complete_guide/sections/navigation/second_screen.dart';
import 'package:flutter_complete_guide/sections/provider/provider_practice_screen.dart';
import 'package:flutter_complete_guide/sections/provider/providers/changing_content.dart';
import 'package:flutter_complete_guide/sections/provider/providers/counting_the_number.dart';
import 'package:flutter_complete_guide/sections/todo/models/note_data.dart';
import 'package:flutter_complete_guide/sections/todo/screens/todo_screen.dart';
import 'package:flutter_complete_guide/sections/user_interface/user_interface_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData.light();
    return ChangeNotifierProvider(
      create: (context) => NoteData(),
      child: MaterialApp(
        theme: theme,
        initialRoute: TodoScreen.routeName,
        routes: <String, WidgetBuilder>{
          '/': (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_) => Counter(),
                  )
                ],
                child: const CounterScreen(),
              ),
          SecondScreen.routeName: (context) => const SecondScreen(),
          BooksGridScreen.routeName: (context) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => BooksProvider(),
                  )
                ],
                child: const BooksGridScreen(),
              ),
          AppBarScreen.routeName: (_) => const AppBarScreen(),
          BottomBarScreen.routeName: (_) => const BottomBarScreen(),
          MaterialStateScreen.routeName: ((_) => const MaterialStateScreen()),
          UserInterfaceScreen.routeName: ((_) => const UserInterfaceScreen()),
          CounterBlocScreen.routeName: ((_) => MultiBlocProvider(providers: [
                BlocProvider<CounterBloc>(
                  create: (context) => CounterBloc(),
                )
              ], child: const CounterBlocScreen())),
          CounterCubitScreen.routeName: (context) =>
              MultiBlocProvider(providers: [
                BlocProvider<CounterCubit>(
                  create: (context) => CounterCubit(),
                )
              ], child: const CounterCubitScreen()),
          HomeCartScreen.routeName: (context) => const HomeCartScreen(),
          TodoScreen.routeName: (context) => const TodoScreen()
        },
        // home: MultiProvider(
        //   providers: [
        //     ChangeNotifierProvider(
        //       create: (context) => CountingTheNumber(),
        //     ),
        //     ChangeNotifierProvider(
        //       create: (context) => ChangingContent(),
        //     )
        //   ],
        //   child: const FirstScreen(),
        // ),
      ),
    );
  }
}
