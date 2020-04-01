import 'package:challenge/model/challegeType.dart';
import 'package:challenge/values/strings.dart';

final singleChallenge = ChallengeType(Strings.singleChallenge, Strings.singleChallenge, enabled: false);
final seriesChallenge = ChallengeType(Strings.seriesChallenge, Strings.seriesChallenge);

final List<ChallengeType> challengeTypes = <ChallengeType>[singleChallenge, seriesChallenge];