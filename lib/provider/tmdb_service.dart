
import 'package:movie_info/provider/api_provider.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TmdbService {
  TMDB tmdbWithCustomLog = TMDB(ApiKeys(API_KEY, ACCESS_TOKEN),
      logConfig: ConfigLogger(
        showErrorLogs: true,
        showLogs: true,
      ),
    
      defaultLanguage: "vi");
}
