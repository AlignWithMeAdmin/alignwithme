db.createCollection("Province", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "Province",
      required: ["id", "name", "districts"],
      properties: {
        "id": { bsonType: "string" },
        "name": { bsonType: "string" },
        "districts": { bsonType: "array", items: { bsonType: "object" } },
      },
    },
  },
});

db.createCollection("PoliticalParty", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "PoliticalParty",
      required: ["id", "name", "symbolPath"],
      properties: {
        "id": { bsonType: "string" },
        "name": { bsonType: "string" },
        "symbolPath": { bsonType: "string" },
      },
    },
  },
});

db.createCollection("LevelOfEducation", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "LevelOfEducation",
      required: ["id", "levelOfEducation"],
      properties: {
        "id": { bsonType: "string" },
        "levelOfEducation": { bsonType: "string" },
      },
    },
  },
});

db.createCollection("Gender", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "Gender",
      required: ["id", "gender"],
      properties: {
        "id": { bsonType: "string" },
        "gender": { bsonType: "enum" },
      },
    },
  },
});

db.createCollection("AgeGroup", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      title: "AgeGroup",
      required: ["id", "ageGroup"],
      properties: {
        "id": { bsonType: "string" },
        "ageGroup": { bsonType: "string" },
      },
    },
  },
});