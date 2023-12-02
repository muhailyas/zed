import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zed/business_logic/story/story_bloc.dart';
import 'package:zed/utils/colors/colors.dart';
import 'package:zed/utils/constants/constants.dart';

class ScreenHightlights extends StatelessWidget {
  const ScreenHightlights({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StoryBloc>().add(const StoryEvent.fetchArchivedStroies());
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Stories archive",
            style: customFontStyle(fontWeight: FontWeight.bold)),
      ),
      body: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedArchivedStroiesError) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is FetchedArchivedStroiesSuccess) {
            final stories = state.stories;
            return GridView.builder(
              itemCount: stories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: .5,
                crossAxisSpacing: .5,
                childAspectRatio: 1 / 1.6,
              ),
              itemBuilder: (context, index) {
                String monthFormat =
                    DateFormat('MMM').format(stories[index].time);
                String dayFormat = DateFormat('d').format(stories[index].time);
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: secondaryDark,
                          image: DecorationImage(
                              image: NetworkImage(stories[index].imageUrl),
                              fit: BoxFit.cover)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: Container(
                        height: screenHeight / 22,
                        width: screenWidth / 12,
                        decoration: BoxDecoration(
                          color: secondaryBlue,
                          borderRadius: radius10 / 2,
                        ),
                        child: Column(
                          children: [
                            Text(
                              dayFormat,
                              style: customFontStyle(
                                  fontWeight: FontWeight.bold, size: 17),
                            ),
                            Text(monthFormat, style: customFontStyle(size: 13)),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          } else if (state is FetchedArchivedStroiesIsEmpty) {
            return Center(
                child: Text("No Stories added yet?", style: customFontStyle()));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
