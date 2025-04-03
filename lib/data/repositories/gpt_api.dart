import 'dart:convert';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/game_settings.dart';
import 'package:shelter_ai/domain/models/disaster.dart';
import 'package:shelter_ai/domain/services/gpt_repository.dart';
import 'package:shelter_ai/data/entities/json_story.dart';
import 'package:shelter_ai/data/entities/json_player.dart';

class GptRepositoryImpl implements GptRepository {
  // Returns api key from file hidden_data.txt
  Future<String> getApiKey() async {
    // Returns API_KEY, type String
    return dotenv.env['API_KEY'] ?? '';
  }

// Sets up request for story-generating procces in GPT 4.o
  Future<String> storySetup(Map<String, String> additionalInfo) async {
    // Unpacks additional_info to variables
    // difficulty - choice('crazy', 'medium', 'normal')
    // playerAmount - int from range(5, 16)
    // language - choice('Русский', 'English')
    // wishes - String text from user
    // familyMode - bool if user wants a family mode
    String playerAmount = additionalInfo['player_amount']!;
    String language = additionalInfo['language']!;
    String wishes = additionalInfo['wishes']!;
    String familyMode = additionalInfo['family_mode']!;
    String additionalText =
        '\n\n<player_amount> = $playerAmount, <language> = "$language", <wishes> = "$wishes", <family_mode> = $familyMode';

    // Reads file to get all story_requests
    // In txt_cont_difficulty holds request text in String
    late Map<String, dynamic> txtCont;

    try {
      String cont = await rootBundle.loadString('assets/request_texts.json');
      txtCont = jsonDecode(cont);
      txtCont['story'] = txtCont['story'] + additionalText;
    } catch (e) {
      print('Error $e');
    }
    print(txtCont["story"]);
    print(additionalText);

    // Returns request text, type String
    return txtCont['story'];
  }

// Sets up the player via additionalInfo
  Future<String> playerSetup(Map<String, String> additionalInfo) async {
    // Unpacks additional_info to variables
    // difficulty - choice('crazy', 'medium', 'normal')
    // story - String (in format of JSON) with scenario for game
    String difficulty = additionalInfo['difficulty']!;
    String story = additionalInfo['story']!;
    String additionalText =
        '\n $story \nОтвет строго в формате JSON, соответствующем указанному шаблону, без отклонений.';

    // Reads file to get all story_requests
    // In txt_cont_difficulty holds request text in String

    late Map<String, dynamic> txtCont;

    try {
      String content = await rootBundle.loadString('assets/request_texts.json');
      txtCont = jsonDecode(content);
      txtCont[difficulty] = txtCont[difficulty] + additionalText;
    } catch (error) {
      print('Error $error');
    }

    // Returns request text, type String
    return txtCont[difficulty];
  }

  Future<String> finaleSetup(Map<String, String> additionalInfo) async {
    // Unpacks additional_info to variables
    // json -
    const String difficulty = 'finale';
    String json = additionalInfo.toString();
    String additionalText =
        '\n $json \nОтвет строго в формате JSON, соответствующем указанному шаблону, без отклонений.';

    // Reads file to get all story_requests
    // In txt_cont_difficulty holds request text in String

    late Map<String, dynamic> txtCont;

    try {
      String content = await rootBundle.loadString('assets/request_texts.json');
      txtCont = jsonDecode(content);
      txtCont[difficulty] = txtCont[difficulty] + additionalText;
    } catch (error) {
      print('Error $error');
    }

    // Returns request text, type String
    return txtCont[difficulty];
  }

// Makes requests to GPT 4.o
// type - choice('player', 'story')
  Future<String> gptRequest(
      String type, Map<String, String> additioanlInfo) async {
    // Sets up request
    // Sets an API key
    OpenAI.apiKey = await getApiKey();

    late String message; // message that gonna be sent to gpt

    // Gets the message
    print('gpt_request');
    switch (type) {
      case "player":
        message = await playerSetup(additioanlInfo);
        break;
      case "story":
        message = await storySetup(additioanlInfo);
        break;
      case "finale":
        message = await finaleSetup(additioanlInfo);
        break;
      default:
        print("Wrong type!");
        throw Error();
    }

    // Sets up the message as an OpenAiMessage object and gives role
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(message),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    // Creates request to GPT 4o, asking for JSON answer and giving the request

    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-4o",
      responseFormat: {"type": "json_object"},
      messages: [systemMessage],
    );

    print('before return');
    return chatCompletion.choices.first.message.content!.first.text!;
  }

// Creates Player sample for game
  Player createPlayer(
      int number, Map<String, dynamic> playerInfo, playerAmount) {
    // Sets all properties for Player
    final playerInforamtion = PlayerCard.fromJson(playerInfo);
    List<bool> knownProperties = [for (var i = 0; i < 6; ++i) false];
    List<String> notes = [for (var i = 0; i < playerAmount; ++i) ''];

    // Actually sets values for Player
    var player = Player(
        id: number,
        name: 'user $number',
        profession: playerInforamtion.profession,
        bio: playerInforamtion.age,
        health: playerInforamtion.health,
        hobby: playerInforamtion.hobbySkills,
        phobia: playerInforamtion.phobias,
        luggage: playerInforamtion.baggage,
        extra: playerInforamtion.additionalInformation,
        lifeStatus: LifeStatus.alive,
        knownProperties: knownProperties,
        notes: notes);

    return player;
  }

// Creates a players from request
  @override
  Future<List<Player>> createPlayers(
      GameSettings settings, Disaster disaster) async {
    // additionalInfo - Map object that will go in gptRequest
    // type - choice('player', 'story')
    final difficulty = ['normal', 'medium', 'crazy'][settings.difficulty - 1];
    Map<String, String> additionalInfo = {
      "story": disaster.answer,
      "difficulty": difficulty
    };
    const type = 'player';

    // Sends request to Chat GPT 4o
    final answer = await gptRequest(type, additionalInfo);

    // Jsonifies response
    // playerInfo.keys: "player_cards"(Map<String, String>),
    // player_cards.keys: "profession", "age", "health", "hobby_skills", "phobias",
    // "baggage", "additional_info"
    final playerInfo = PlayersJs.fromJson(jsonDecode(answer));
    List<Player> players = [];

    // In loop creates players
    for (int i = 0; i < settings.playersCount; i++) {
      Player player =
          createPlayer(i + 1, playerInfo.playerCards[i], settings.playersCount);
      players.add(player);
    }

    return players;
  }

// Creates story for game
// needs user wishes, user amount, user language and if they wanna play with family mode on
  @override
  Future<Disaster> createDisaster(GameSettings settings) async {
    // Sets up additional information and type
    print("we are here");
    Map<String, String> additionalInfo = {
      "wishes": settings.plot,
      "player_amount": settings.playersCount.toString(),
      "language": settings.language,
      "family_mode": settings.safeMode.toString()
    };
    String type = 'story';

    late bool success;

    // Sends request to Chat GPT 4o
    String answer = await gptRequest(type, additionalInfo);
    print('Good request');


    // Jsonifies response
    // story.keys: "player_amount"(int), "language"(String), "family_mode"(Bool),
    // "wishes"(String), "disaster"(Map<"String", dynamic>),
    // "short_description"(String), "bunker"(Map<String, dynamic>)
    // story["disaster"].keys: "name"(String), "history"(String), "distribution"(String)
    // "world_situation"(String)
    // story["bunker"],keys: "name"(String), "location"(String), "capacity"(String)
    // "rooms"(List<String>), "resources"(list<String>)
    final story = Story.fromJson(jsonDecode(answer));

    // Sets parameters for Disaster object
    var disasterDesc = StringBuffer();
    disasterDesc.writeAll([
      story.disaster.history,
      '\n',
      story.disaster.distribution,
      '\n',
      story.disaster.worldSituation
    ]);
    String disasterDescription = disasterDesc.toString();
    int shelterCapacity = (settings.playersCount / 2 - 0.1).round();

    // Creates sample of Disaster object
    Disaster disasterSample = Disaster(
        name: story.disaster.name,
        disasterDescription: disasterDescription,
        disasterShortDescription: story.shortDescription,
        shelterName: story.bunker.name,
        location: story.bunker.location,
        description: story.bunker.capacity,
        capacity: shelterCapacity,
        rooms: story.bunker.rooms,
        resources: story.bunker.resources,
        answer: answer);

    return disasterSample;
  }

// Player amount(int), Language(String), family_mode(bool), wishes(String), difficulty(String)
// Difficulty - choice('crazy', 'medium', 'normal')
// Returns {'disaster': Disaster, 'players': List<Player>}
/*  @override
  Future<Map<String, Object>> createGame(GameSettings settings) async {
    // Gets answer from first request (Creating game story) and Gets Disaster object
    // response = [Disaster, String]
    // List<Object> response = await createStory(settings.plot,
    //    settings.playersCount, settings.language, settings.safeMode);

    // Unpacks response into disasterSample and story
    */ /*String? story = response[1] as String?;
    Disaster? disasterSample = response[0] as Disaster?;*/ /*

    // Gets answer from second request (Creating players for game)
    // response = [Player, Player, Player, ...] in general playerAmount
    */ /*List<Player> playerList = await createPlayers(
        story!,
        ['normal', 'medium', 'crazy'][settings.difficulty - 1],
        disasterSample!,
        settings.playersCount);*/ /*

    // Map<String, Object> answer = {
    //   'disaster': disasterSample,
    //   'player_list': playerList
    // };
    // return answer;
  }*/

// Gets final from GPT
  @override
  Future<String> getFinale(GameSettings settings, Disaster disaster,
      List<Player> alivePlayers, List<Player> kickedPlayer) async {
    // Sets up type and additional info for request
    String type = 'finale';
    Map<String, String> additionalInfo = {
      'language': settings.language,
      'short_description': disaster.disasterShortDescription,
      'winner_players': alivePlayers.toString(),
      'kicked_players': kickedPlayer.toString()
    };

    // Sends request to GPT 4.o
    String answer = await gptRequest(type, additionalInfo);

    // Decodes answer and returns it
    Map<String, dynamic> decodedAnswer = jsonDecode(answer);
    String returnData = decodedAnswer['final']!;

    return returnData;
  }
}
