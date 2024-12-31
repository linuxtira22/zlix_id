import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zlix_id/domain/entities/movie.dart';
import 'package:zlix_id/presentation/misc/methods.dart';
import 'package:zlix_id/presentation/providers/movie/actor_provider.dart';
import 'package:zlix_id/presentation/widget/network_image_card.dart';

List<Widget> castAndCrew({required Movie movie, required WidgetRef ref}) => [
      Padding(
        padding: const EdgeInsets.only(left: 24),
        child: const Text(
          'Cast and crew',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      verticalSpace(10),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            horizontalSpace(24),
            ...(ref.watch(actorsProvider(movieId: movie.id)).whenOrNull(
                      data: (actors) => actors
                          .where((element) => element.profilePath != null)
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  NetworkImageCard(
                                    width: 100,
                                    height: 152,
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w185/${e.profilePath}',
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      e.name,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                    ) ??
                []), horizontalSpace(14),
          ],
        ),
      )
    ];
