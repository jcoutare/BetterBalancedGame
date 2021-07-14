-- Give sewers +1 amenity
UPDATE Buildings SET Entertainment=1 WHERE BuildingType='BUILDING_SEWER';

-- Green District cost same as other district (from 81)
UPDATE Districts SET Cost=54 WHERE DistrictType IN ('DISTRICT_CANAL', 'DISTRICT_DAM');

-- Commercial hub buildings buff :
UPDATE Building_GreatPersonPoints SET PointsPerTurn=2 WHERE BuildingType='BUILDING_BANK';
UPDATE Building_GreatPersonPoints SET PointsPerTurn=3 WHERE BuildingType='BUILDING_STOCK_EXCHANGE';
UPDATE Building_YieldChanges SET YieldChange=5 WHERE BuildingType='BUILDING_STOCK_EXCHANGE' AND YieldType='YIELD_GOLD';
UPDATE Building_YieldChangesBonusWithPower SET YieldChange=10 WHERE BuildingType='BUILDING_STOCK_EXCHANGE' AND YieldType='YIELD_GOLD';

-- Commercial hub building traderoute modifier :
INSERT INTO Modifiers(ModifierId, ModifierType) VALUES
    ('BBG_BANK_TRADEROUTE_FROM_DOMESTIC', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
    ('BBG_BANK_TRADEROUTE_TO_DOMESTIC', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_DOMESTIC', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_DOMESTIC', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS'),
    ('BBG_BANK_TRADEROUTE_FROM_INTERNATIONAL', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('BBG_BANK_TRADEROUTE_TO_INTERNATIONAL', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_INTERNATIONAL', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_INTERNATIONAL', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');

INSERT INTO ModifierArguments(ModifierId, Name, Value) VALUES
    ('BBG_BANK_TRADEROUTE_FROM_DOMESTIC', 'YieldType', 'YIELD_GOLD'),
    ('BBG_BANK_TRADEROUTE_FROM_DOMESTIC', 'Amount', '2'),
    ('BBG_BANK_TRADEROUTE_FROM_DOMESTIC', 'Domestic', '1'),
    ('BBG_BANK_TRADEROUTE_TO_DOMESTIC', 'YieldType', 'YIELD_GOLD'),
    ('BBG_BANK_TRADEROUTE_TO_DOMESTIC', 'Amount', '1'),
    ('BBG_BANK_TRADEROUTE_TO_DOMESTIC', 'Domestic', '1'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_DOMESTIC', 'YieldType', 'YIELD_GOLD'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_DOMESTIC', 'Amount', '4'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_DOMESTIC', 'Domestic', '1'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_DOMESTIC', 'YieldType', 'YIELD_GOLD'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_DOMESTIC', 'Amount', '2'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_DOMESTIC', 'Domestic', '1'),
    ('BBG_BANK_TRADEROUTE_FROM_INTERNATIONAL', 'YieldType', 'YIELD_GOLD'),
    ('BBG_BANK_TRADEROUTE_FROM_INTERNATIONAL', 'Amount', '2'),
    ('BBG_BANK_TRADEROUTE_FROM_INTERNATIONAL', 'Domestic', '0'),
    ('BBG_BANK_TRADEROUTE_TO_INTERNATIONAL', 'YieldType', 'YIELD_GOLD'),
    ('BBG_BANK_TRADEROUTE_TO_INTERNATIONAL', 'Amount', '1'),
    ('BBG_BANK_TRADEROUTE_TO_INTERNATIONAL', 'Domestic', '0'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_INTERNATIONAL', 'YieldType', 'YIELD_GOLD'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_INTERNATIONAL', 'Amount', '4'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_INTERNATIONAL', 'Domestic', '0'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_INTERNATIONAL', 'YieldType', 'YIELD_GOLD'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_INTERNATIONAL', 'Amount', '2'),
    ('BBG_STOCK_EXCHANGE_TRADEROUTE_TO_INTERNATIONAL', 'Domestic', '0');

INSERT INTO BuildingModifiers(BuildingType, ModifierId) VALUES
    ('BUILDING_BANK', 'BBG_BANK_TRADEROUTE_FROM_DOMESTIC'),
    ('BUILDING_BANK', 'BBG_BANK_TRADEROUTE_TO_DOMESTIC'),
    ('BUILDING_STOCK_EXCHANGE', 'BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_DOMESTIC'),
    ('BUILDING_STOCK_EXCHANGE', 'BBG_STOCK_EXCHANGE_TRADEROUTE_TO_DOMESTIC'),
    ('BUILDING_BANK', 'BBG_BANK_TRADEROUTE_FROM_INTERNATIONAL'),
    ('BUILDING_BANK', 'BBG_BANK_TRADEROUTE_TO_INTERNATIONAL'),
    ('BUILDING_STOCK_EXCHANGE', 'BBG_STOCK_EXCHANGE_TRADEROUTE_FROM_INTERNATIONAL'),
    ('BUILDING_STOCK_EXCHANGE', 'BBG_STOCK_EXCHANGE_TRADEROUTE_TO_INTERNATIONAL');