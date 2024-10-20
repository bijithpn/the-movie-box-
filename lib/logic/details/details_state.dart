part of 'details_bloc.dart';

sealed class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object> get props => [];
}

final class DetailsInitial extends DetailsState {}

final class DetailsLoading extends DetailsState {}

final class EpisodesDetailsLoading extends DetailsState {}

final class MovieDetailsLoaded extends DetailsState {
  final MovieDetails movie;
  final List<Cast> cast;
  final List<Crew> crew;
  final List<Show> similarMovies;
  final List<Buy> watchProvider;
  final List<Reviews> reviews;
  final List<Videos> videos;
  const MovieDetailsLoaded(
      {required this.cast,
      required this.watchProvider,
      required this.videos,
      required this.reviews,
      required this.crew,
      required this.similarMovies,
      required this.movie});
}

final class SeriesDetailsLoaded extends DetailsState {
  final SeriesDetails series;
  final List<Cast> cast;
  final List<Crew> crew;
  final List<Show> similarMovies;
  final List<Buy> watchProvider;
  final List<Reviews> reviews;
  final List<Videos> videos;
  const SeriesDetailsLoaded({
    required this.cast,
    required this.crew,
    required this.videos,
    required this.reviews,
    required this.similarMovies,
    required this.series,
    required this.watchProvider,
  });
}

final class SeriesEpisodesLoaded extends DetailsState {
  final SeriesEpisodes seriesEpisodes;
  const SeriesEpisodesLoaded({
    required this.seriesEpisodes,
  });
}

final class SeriesEpisodeError extends DetailsState {
  final String error;
  const SeriesEpisodeError({
    required this.error,
  });
}

final class DetailsError extends DetailsState {
  final String error;
  const DetailsError({required this.error});
}
