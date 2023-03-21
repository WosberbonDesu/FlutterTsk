import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:lottie/lottie.dart';
import 'package:sqflite_practice/core/constants/colors.dart';
import 'core/bloc/bloc/crud_bloc.dart';
import 'features/user_interface/page/add_todo.dart';
import 'features/user_interface/page/details_page.dart';
import 'features/user_interface/page/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CrudBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class SqFliteDemo extends StatefulWidget {
  const SqFliteDemo({Key? key}) : super(key: key);

  @override
  State<SqFliteDemo> createState() => _SqFliteDemoState();
}

class _SqFliteDemoState extends State<SqFliteDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: LinearColors.wbackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage("https://images.unsplash.com/photo-1630155923002-17db0f219f1f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80")
            )
          ),

        ),
        centerTitle: true,
        title: GlowText(
          'TODOAPP',
          style: GoogleFonts.anekDevanagari(fontSize: 40, color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (c) => const AddTodoPage()));
        },
      ),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          if (state is CrudInitial) {
            context.read<CrudBloc>().add(const FetchTodos());
          }
          if (state is DisplayTodos) {
            return SafeArea(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 500,
                child: Column(children: [
                  Center(
                    child: Text(
                      'Add a Todo'.toUpperCase(),
                      style:  GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 16)
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("TO DO List:"),
                  state.todo.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: const EdgeInsets.all(8),
                            itemCount: state.todo.length,
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  context.read<CrudBloc>().add(
                                      FetchSpecificTodo(id: state.todo[i].id!));

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) =>
                                          const DetailsPage()),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 80,
                                  margin: const EdgeInsets.only(bottom: 14),
                                  child: Card(
                                    elevation: 10,
                                    color: Colors.white,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [

                                           Padding(
                                             padding: const EdgeInsets.only(left: 8.0),
                                             child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Text(
                                                  "TITLE: ${state.todo[i].title.toUpperCase()}",
                                                  style:  GoogleFonts.didactGothic(
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,fontSize: 16),
                                          ),
                                                 Text(
                                                   "DESCRIPTION: ${state.todo[i].title.toUpperCase()}",
                                                   style:  GoogleFonts.didactGothic(
                                                       color: Colors.black,
                                                       fontWeight: FontWeight.normal,fontSize: 14),
                                                 ),
                                               ],
                                             ),
                                           ),
                                        IconButton(
                                            onPressed: () {
                                              context
                                                  .read<CrudBloc>()
                                                  .add(DeleteTodo(
                                                  id: state
                                                      .todo[i].id!));
                                              ScaffoldMessenger.of(
                                                  context)
                                                  .showSnackBar(
                                                  const SnackBar(
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                    content:
                                                    Text("deleted todo"),
                                                  ));
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      :  Column(
                        children: [
                          Text("you havent entered to do yet".toUpperCase(),style: GoogleFonts.didactGothic(color: Colors.white),),
                          LottieBuilder.network("https://assets1.lottiefiles.com/packages/lf20_WpDG3calyJ.json"),
                        ],
                      ),
                ]),
              ),
            );
          }
          return Container(
            color: Colors.white,
            child: const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
