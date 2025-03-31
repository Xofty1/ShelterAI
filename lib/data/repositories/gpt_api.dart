import 'dart:convert';
import 'dart:io';
import 'package:dart_openai/dart_openai.dart';


import 'package:shelter_ai/domain/models/player.dart';
import 'package:shelter_ai/domain/models/disaster.dart';

// Returns api key from file hidden_data.txt
Future<String> getApiKey() async {
  // Reads the file and puts api key from it in API_KEY
  // In txtContent holds jsnoDecoded data.
  File file = File('./lib/hidden_data.txt');
  String API_KEY = '';

  try {
    String content = await file.readAsString();
    Map<String, dynamic> txtContent = jsonDecode(content);
    API_KEY = txtContent['API_KEY'];
  } catch (e) {
    print('Error $e');
  }

  // Returns API_KEY, type String
  return API_KEY;
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
  String additionalText = '\n\n<player_amount> = $playerAmount, <language> = "$language", <wishes> = "$wishes", <family_mode> = $familyMode';

  // Reads file to get all story_requests
  // In txt_cont_difficulty holds request text in String
  File file = File('./lib/request_texts.txt');
  String cont = '';

  late Map<String, dynamic> txtCont;

  try {
    cont = await file.readAsString();
    txtCont = jsonDecode(cont);
    txtCont['story'] = txtCont['story'] + additionalText;
  } catch (e) {
    print('Error $e');
  }

  // Returns request text, type String
  return txtCont['story'];
}


// Sets up the player via additionalInfo
Future<String> playerSetup(Map<String, String> additionalInfo) async{
  // Unpacks additional_info to variables
  // difficulty - choice('crazy', 'medium', 'normal')
  // story - String (in format of JSON) with scenario for game
  String difficulty = additionalInfo['difficulty']!;
  String story = additionalInfo['story']!;
  String additionalText = '\n $story \nОтвет строго в формате JSON, соответствующем указанному шаблону, без отклонений.';

  // Reads file to get all story_requests
  // In txt_cont_difficulty holds request text in String
  File file = File('./lib/request_texts.txt');

  late Map<String, dynamic> txtCont;

  try {
    String content = await file.readAsString();
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
Future<String> gptRequest(String type, Map<String, String> additioanlInfo) async {
  // Sets up request
  // Sets an API key
  OpenAI.apiKey = await getApiKey();

  String message = ''; // message that gonna be sent to gpt

  // Gets the message
  if (type == "player"){
    message = await playerSetup(additioanlInfo);
  } else if (type == "story") {
    message = await storySetup(additioanlInfo);
  } else {
    print('Wrong type!');
    throw Error();
  }

  // Sets up the message as an OpenAiMessage object and gives role
  final systemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        message
      ),
    ],
    role: OpenAIChatMessageRole.assistant,
  );

  // Creates request to GPT 4o, asking for JSON answer and giving the request
  OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
    model: "gpt-4o",
    responseFormat: {"type": "json_object"},
    messages: [systemMessage],
  );

  String answer = chatCompletion.choices.first.message.content!.first.text!;

  return answer;
}

// Creates Player sample for game
Player createPlayer(int number, Map<String, dynamic> playerInfo, playerAmount){
  // Corrects number to surely become natural
  ++number;

  // Sets all properties for Player
  String profession = playerInfo['profession']!;
  String age = playerInfo['age']!;
  String health = playerInfo['health']!;
  String hobbySkills = playerInfo['hobby_skills']!;
  String phobias = playerInfo['phobias']!;
  String baggage = playerInfo['baggage']!;
  String additionalInfo = playerInfo['additional_information']!;
  List<bool> knownProperties = [for (var i = 0; i < playerAmount; ++i) false];
  List<String> notes = [for (var i = 0; i < playerAmount; ++i) ''];

  // Actually sets values for Player
  var player = Player(name: 'user $number',
      profession: profession,
      bio: age, health: health,
      hobby: hobbySkills, phobia: phobias,
      luggage: baggage, extra: additionalInfo,
      lifeStatus: LifeStatus.alive,
      knownProperties: knownProperties,
      notes: notes);

  return player;
}

// Creates a players from request
Future<List<Player>> createPlayers(String story, String difficulty, Disaster disasterSample, int playersAmount) async{
  // additionalInfo - Map object that will go in gptRequest
  // type - choice('player', 'story')
  Map<String, String> additionalInfo = {"story": story, "difficulty": difficulty};
  String type = 'player';

  // Sends request to Chat GPT 4o
  String answer = await gptRequest(type, additionalInfo);
  // Jsonifies response
  // playerInfo.keys: "player_cards"(Map<String, String>),
  // player_cards.keys: "profession", "age", "health", "hobby_skills", "phobias",
  // "baggage", "additional_info"
  Map<String, dynamic> playerInfo = jsonDecode(answer);
  List<Player> players = [];

  // In loop creates players
  for (int i = 0; i < playersAmount; i++){
    Player player = createPlayer(i, playerInfo['player_cards'][i], playersAmount);
    players.add(player);
  }

  return players;
}

// Creates story for game
// needs user wishes, user amount, user language and if they wanna play with family mode on
Future<List<Object>> createStory(String wishes, int playerAmount, String language, bool familyMode) async {
  // Sets up additional information and type
  Map<String, String> additionalInfo = {"wishes": wishes, "player_amount": playerAmount.toString(), "language": language, "family_mode": familyMode.toString()};
  String type = 'story';

  // Sends request to Chat GPT 4o
  String answer = await gptRequest(type, additionalInfo);

  // Jsonifies response
  // story.keys: "player_amount"(int), "language"(String), "family_mode"(Bool),
  // "wishes"(String), "disaster"(Map<"String", dynamic>),
  // "short_description"(String), "bunker"(Map<String, dynamic>)
  // story["disaster"].keys: "name"(String), "history"(String), "distribution"(String)
  // "world_situation"(String)
  // story["bunker"],keys: "name"(String), "location"(String), "capacity"(String)
  // "rooms"(List<String>), "resources"(list<resources>)
  Map<String, dynamic> story = jsonDecode(answer);

  // Sets parameters for Disaster object
  String disasterName = story['disaster']["name"];
  String disasterDescription = story['disaster']['history'] + '\n' + story['disaster']['distribution'] + '\n' + story['disaster']['world_situation'];
  String disasterShortDescription = story['short_description'];
  String shelterName = story['bunker']['name'];
  String shelterLocation = story['bunker']['location'];
  String shelterDescription = story['bunker']['capacity'];
  int shelterCapacity = (playerAmount / 2 - 0.1).round();
  List<String> shelterRooms = (story['bunker']['rooms'] as List).map((e) => e as String).toList();
  List<String> shelterResources = (story['bunker']['resources'] as List).map((x) => x as String).toList();

  // Creates sample of Disaster object
  Disaster disasterSample = Disaster(name: disasterName, disasterDescription: disasterDescription, disasterShortDescription: disasterShortDescription, shelterName: shelterName, location: shelterLocation, description: shelterDescription, capacity: shelterCapacity, rooms: shelterRooms, resources: shelterResources);

  // Structs returnData in one variable
  List<Object> returnData = [disasterSample, answer];

  return returnData;
}


// Player amount(int), Language(String), family_mode(bool), wishes(String), difficulty(String)
// Difficulty - choice('crazy', 'medium', 'normal')
// Returns {'disaster': Disaster, 'players': List<Player>}
Future<Map<String, Object>> createGame(int players, String language, bool familyMode, String wishes, String difficulty) async {
  // Gets answer from first request (Creating game story) and Gets Disaster object
  // response = [Disaster, String]
  List<Object> response = await createStory(wishes, players, language, familyMode);

  // Unpacks response into disasterSample and story
  String? story = response[1] as String?;
  Disaster? disasterSample = response[0] as Disaster?;

  // Gets answer from second request (Creating players for game)
  // response = [Player, Player, Player, ...] in general playerAmount
  List<Player> playerList = await createPlayers(story!, difficulty, disasterSample!, players);

  Map<String, Object> answer = {'disaster': disasterSample, 'player_list': playerList};
  return answer;
}


/*
void main() async{
  // Player amount(int), Language(String), family_mode(bool), wishes(String), type(String)
  await createGame(11, 'Русский', true, 'Всё происходит в 1940', 'crazy');
  */
/*Disaster disasterSample = full_game['disaster'] as Disaster;
  List<Player> playerList = full_game['player_list'] as List<Player>;*//*

  */
/*print(disasterSample.name);
  print(disasterSample.disasterDescription);
  print(disasterSample.disasterShortDescription);
  print(disasterSample.shelterName);
  print(disasterSample.capacity);
  print(disasterSample.description);
  print(disasterSample.location);
  print(disasterSample.rooms);
  print(disasterSample.resources);
  for (final player in playerList){
    print(player.name);
    print(player.profession);
    print(player.bio);
    print(player.health);
    print(player.hobby);
    print(player.phobia);
    print(player.luggage);
    print(player.extra);
    print(player.knownProperties);
  }*//*

}*/
