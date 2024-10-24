import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:the_movie_box/core/config/api_config.dart';
import 'package:the_movie_box/core/routes/routes.dart';
import 'package:the_movie_box/data/model/series_details.dart';

import '../../widgets/widgets.dart';

class SeasonViewBuilder extends StatelessWidget {
  final List<Season> seasons;
  final int seriesId;
  final String seriesName;
  const SeasonViewBuilder({
    super.key,
    required this.seasons,
    required this.seriesId,
    required this.seriesName,
  });

  @override
  Widget build(BuildContext context) {
    return seasons.isEmpty
        ? const SizedBox.shrink()
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: seasons.length,
            itemBuilder: (_, i) {
              var season = seasons[i];
              return season.seasonNumber == 0
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () {
                        context.push(Routes.episodeDetails, extra: {
                          "seriesName": seriesName,
                          "seriesId": seriesId,
                          "seasonCount": season.seasonNumber,
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            CachedImageWidget(
                              width: 80,
                              height: 100,
                              imageUrl: APIConfig.imageURL +
                                  (season.posterPath ?? ""),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    season.name,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  if (season.overview.isNotEmpty)
                                    Text(
                                      season.overview,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
            });
  }
}
