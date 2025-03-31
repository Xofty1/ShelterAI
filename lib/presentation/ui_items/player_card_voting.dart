import 'package:flutter/material.dart';

class PlayerCardVoting extends StatelessWidget {
  final String number;
  final String name;
  final String profession;
  final String? description;
  final bool hasNote;
  final bool isExpanded;
  final String? emptyText;
  final bool isEmpty;
  final bool hasLongProfession;

  const PlayerCardVoting({
    super.key,
    required this.number,
    required this.name,
    required this.profession,
    this.description,
    this.hasNote = false,
    this.isExpanded = false,
    this.emptyText,
    this.isEmpty = false,
    this.hasLongProfession = false,
  });

  @override
  Widget build(BuildContext context) {

    const textColor = Color(0xFF654E32);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE5E5E5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD6C7B0),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBFAA8F),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                          number,
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                        name,
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFD6C7B0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
            child: Center(
              child: Text(
                  profession,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }
}

