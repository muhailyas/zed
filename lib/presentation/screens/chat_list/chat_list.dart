import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zed/business_logic/chat/chat_bloc.dart';
import 'package:zed/data/data_sources/message_data_source/message_data_source.dart';
import 'package:zed/data/models/chat_user/chat_user.dart';
import 'package:zed/presentation/screens/chat_list/widgets/chat_tile_user_widget/chat_tile_user_widget.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Iconsax.arrow_left),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text("Chat Room", style: customFontStyle(size: 25)),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: ChatUserSearchDelegate());
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            height05,
            Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              width: double.infinity,
              child: StreamBuilder(
                  stream:
                      MessageDataSource().getChatUserWithUserProfileStream(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.isEmpty) {
                        return Center(
                          child: SizedBox(
                              height: screenHeight / 4,
                              width: double.infinity,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text("Chat room is empty",
                                      style: customFontStyle()))),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final data = snapshot.data![index];
                          return ChatUserTileWidget(data: data);
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      )),
    );
  }
}

class ChatUserSearchDelegate
    extends SearchDelegate<List<ChatUserWithUserProfile>> {
  ChatUserSearchDelegate() : super(searchFieldStyle: customFontStyle());
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: const AppBarTheme(
            backgroundColor: primaryColor, foregroundColor: whiteColor),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: customFontStyle(size: 17), border: InputBorder.none));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, []);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<ChatBloc>().add(ChatEvent.searchChatUsers(query: query));

    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) =>
          current is ChatUsersSearchResult ||
          current is Initial ||
          current is SearchResultIsEmpty,
      builder: (context, state) {
        if (state is ChatUsersSearchResult) {
          return ListView.builder(
            itemCount: state.users.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final users = state.users[index];
              return ChatUserTileWidget(data: users);
            },
          );
        } else if (state is SearchResultIsEmpty) {
          return Center(
            child: SizedBox(
                height: screenHeight / 4,
                width: double.infinity,
                child: Align(
                    alignment: Alignment.topCenter,
                    child:
                        Text("Chat room is empty", style: customFontStyle()))),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
        stream: MessageDataSource().getChatUserWithUserProfileStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: SizedBox(
                    height: screenHeight / 4,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: Text("Chat room is empty",
                            style: customFontStyle()))),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];
                return ChatUserTileWidget(data: data);
              },
            );
          }
          return const SizedBox();
        });
  }
}
