db.createCollection("Questions", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "Questions",
      required: ["_id"],
      properties: {
        "_id": { bsonType: "objectId" },
        "question": { bsonType: "string" },
      },
    },
  },
});

db.createCollection("Candidates", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "Candidates",
      required: ["_id", "name", "politicalParty"],
      properties: {
        "_id": { bsonType: "objectId" },
        "name": { bsonType: "string" },
        "politicalParty": { bsonType: "string" },
        "partySymbol": { bsonType: "string" },
        "policyResponses": { bsonType: "array", items: { bsonType: "object" } },
      },
    },
  },
});

db.createCollection("Users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "Users",
      required: ["_id"],
      properties: {
        "_id": { bsonType: "objectId" },
        "email": { bsonType: "string" },
        "password": { bsonType: "string" },
        "province": { bsonType: "string" },
        "district": { bsonType: "string" },
        "pollingDivision": { bsonType: "string" },
        "gender": { bsonType: "string" },
        "ageGroup": { bsonType: "string" },
        "levelOfEducation": { bsonType: "string" },
        "occupation": { bsonType: "string" },
        "userResponses": { bsonType: "array", items: { bsonType: "object" } },
      },
    },
  },
});