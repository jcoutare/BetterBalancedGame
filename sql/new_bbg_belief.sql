-- Created by iElden

-- PANTHEON --

-- Earth Godess +1 faith on appeal
UPDATE Modifiers SET SubjectRequirementSetId='PLOT_CHARMING_APPEAL' WHERE ModifierId='EARTH_GODDESS_APPEAL_FAITH_MODIFIER';

-- Fire Goddess +3
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='GODDESS_OF_FIRE_FEATURES_FAITH_MODIFIER' AND Name='Amount';

-- Dance of aurora only on flat tile
UPDATE ModifierArguments SET Value='0' WHERE ModifierId='DANCE_OF_THE_AURORA_FAITHTUNDRAHILLSADJACENCY' AND Name='Amount';

-- Divine spark on District instead of building
UPDATE Modifiers SET ModifierType='MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', SubjectRequirementSetId='DISTRICT_IS_CAMPUS' WHERE ModifierId='DIVINE_SPARK_SCIENTIST_MODIFIER';
-- UPDATE Modifiers SET ModifierType='MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', SubjectRequirementSetId='DISTRICT_IS_THEATER' WHERE ModifierId='DIVINE_SPARK_WRITER_MODIFIER';
-- Divine spark +1 engineer:
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_DIVINE_SPARK_ENGINEER', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('BBG_DIVINE_SPARK_ENGINEER_MODIFIER', 'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS', 'DISTRICT_IS_INDUSTRIAL_ZONE');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_DIVINE_SPARK_ENGINEER', 'ModifierId', 'BBG_DIVINE_SPARK_ENGINEER_MODIFIER'),
    ('BBG_DIVINE_SPARK_ENGINEER_MODIFIER', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
    ('BBG_DIVINE_SPARK_ENGINEER_MODIFIER', 'Amount', '1');
INSERT INTO BeliefModifiers(BeliefType, ModifierID) VALUES
    ('BELIEF_DIVINE_SPARK', 'BBG_DIVINE_SPARK_ENGINEER');

-- Religious settlement: +20% production towards settler and 3 free tiles
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
    ('BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD_MODIFIER', 'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION', NULL),
    ('BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
    ('BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB_MODIFIER', 'MODIFIER_PLAYER_ADJUST_CITY_TILES', NULL);
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD', 'ModifierId', 'BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD_MODIFIER'),
    ('BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB', 'ModifierId', 'BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB_MODIFIER'),
    ('BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD_MODIFIER', 'UnitType', 'UNIT_SETTLER'),
    ('BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD_MODIFIER', 'Amount', '20'),
    ('BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB_MODIFIER', 'Amount', '2');
INSERT INTO BeliefModifiers(BeliefType, ModifierID) VALUES
    ('BELIEF_RELIGIOUS_SETTLEMENTS', 'BBG_RELIGIOUS_SETTLEMENT_SETTLER_PROD'),
    ('BELIEF_RELIGIOUS_SETTLEMENTS', 'BBG_RELIGIOUS_SETTLEMENT_TILE_GRAB');

-- Initiation Rites gives 30% faith for each military land unit produced
INSERT INTO Modifiers(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES
    ('INITIATION_RITES_FAITH_YIELD_CPL_MOD', 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 0, 0, 'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD', 'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST', 0, 0, NULL),
    ('BBG_INITIATION_RITES_FREE_WARRIOR', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 0, 0, 'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
    ('BBG_INITIATION_RITES_FREE_WARRIOR_MODIFIER', 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 1, 1, 'PLAYER_HAS_AT_LEAST_ONE_CITY_REQUIREMENTS');
INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('INITIATION_RITES_FAITH_YIELD_CPL_MOD' , 'ModifierId', 'INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD'),
    ('INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD', 'YieldType', 'YIELD_FAITH'),
    ('INITIATION_RITES_FAITH_YIELD_MODIFIER_CPL_MOD', 'UnitProductionPercent', '30'),
    ('BBG_INITIATION_RITES_FREE_WARRIOR', 'ModifierId', 'BBG_INITIATION_RITES_FREE_WARRIOR_MODIFIER'),
    ('BBG_INITIATION_RITES_FREE_WARRIOR_MODIFIER', 'UnitType', 'UNIT_WARRIOR'),
    ('BBG_INITIATION_RITES_FREE_WARRIOR_MODIFIER', 'Amount', '2'),
    ('BBG_INITIATION_RITES_FREE_WARRIOR_MODIFIER', 'AllowUniqueOverride', '1');
DELETE FROM BeliefModifiers WHERE BeliefType='BELIEF_INITIATION_RITES';
INSERT INTO BeliefModifiers(BeliefType, ModifierID) VALUES
    ('BELIEF_INITIATION_RITES', 'INITIATION_RITES_FAITH_YIELD_CPL_MOD'),
    ('BELIEF_INITIATION_RITES', 'BBG_INITIATION_RITES_FREE_WARRIOR');

-- God of forge: 25 => 30%
UPDATE ModifierArguments SET Value='30' WHERE ModifierId='GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' AND Name='Amount';

-- RELIGIONS BELIEF --
-- DOF nerf
UPDATE ModifierArguments SET Value='3' WHERE ModifierId='DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER' AND Name='Amount';
-- Crusade nerf to +5
UPDATE ModifierArguments SET Value='5' WHERE ModifierId='JUST_WAR_COMBAT_BONUS_MODIFIER' AND Name='Amount';

-- Stewardship to +2/+2
UPDATE ModifierArguments SET Value='2' WHERE Name='Amount' AND ModifierId IN ('STEWARDSHIP_SCIENCE_DISTRICTS_MODIFIER', 'STEWARDSHIP_GOLD_DISTRICTS_MODIFIER');

-- Synagogue to 7 Faith:
UPDATE Building_YieldChanges SET YieldChange=7 WHERE BuildingType='BUILDING_SYNAGOGUE' AND YieldType='YIELD_FAITH';

-- Jesuit Education give 15% discount on campus and theater purchase.
INSERT INTO Modifiers(ModifierId, ModifierType, SubjectRequirementSetId)
    SELECT 'BBG_GIVER_PURCHASE_CHEAPER_' || Buildings.BuildingType, 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER', 'CITY_FOLLOWS_RELIGION_REQUIREMENTS'
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
    SELECT 'BBG_GIVER_PURCHASE_CHEAPER_' || Buildings.BuildingType, 'ModifierId', 'BBG_PURCHASE_CHEAPER_' || Buildings.BuildingType
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
INSERT INTO Types(Type, Kind) VALUES
    ('BBG_MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST', 'KIND_MODIFIER');
INSERT INTO DynamicModifiers(ModifierType, CollectionType, EffectType) VALUES
    ('BBG_MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST', 'COLLECTION_OWNER', 'EFFECT_ADJUST_BUILDING_PURCHASE_COST');
INSERT INTO Modifiers(ModifierId, ModifierType)
    SELECT 'BBG_PURCHASE_CHEAPER_' || Buildings.BuildingType, 'BBG_MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST'
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
    SELECT 'BBG_PURCHASE_CHEAPER_' || Buildings.BuildingType, 'BuildingType', BuildingType
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
INSERT INTO ModifierArguments(ModifierId, Name, Value)
    SELECT 'BBG_PURCHASE_CHEAPER_' || Buildings.BuildingType, 'Amount', '15'
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
INSERT INTO BeliefModifiers(BeliefType, ModifierID)
    SELECT 'BELIEF_JESUIT_EDUCATION', 'BBG_GIVER_PURCHASE_CHEAPER_' || Buildings.BuildingType
    FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_THEATER');
