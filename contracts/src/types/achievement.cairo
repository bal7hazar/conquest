use conquest::elements::achievements;
use conquest::models::tile::Tile;

// Constants

pub const ACHIEVEMENT_COUNT: u8 = 20;

#[derive(Copy, Drop)]
enum Achievement {
    None,
    Squire,
    ExplorerI,
    ExplorerII,
    ExplorerIII,
    BattlelordI,
    BattlelordII,
    BattlelordIII,
    ConquerorI,
    ConquerorII,
    ConquerorIII,
    BreederI,
    BreederII,
    BreederIII,
    StrategistI,
    StrategistII,
    StrategistIII,
    Opportunist,
    Ruler,
    Maximalist,
    Warlord,
}

#[generate_trait]
impl AchievementImpl of AchievementTrait {
    #[inline]
    fn identifier(self: Achievement) -> felt252 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::identifier(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::identifier(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::identifier(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::identifier(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::identifier(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::identifier(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::identifier(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::identifier(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::identifier(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::identifier(2),
            Achievement::BreederI => achievements::breeder::Breeder::identifier(0),
            Achievement::BreederII => achievements::breeder::Breeder::identifier(1),
            Achievement::BreederIII => achievements::breeder::Breeder::identifier(2),
            Achievement::StrategistI => achievements::strategist::Strategist::identifier(0),
            Achievement::StrategistII => achievements::strategist::Strategist::identifier(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::identifier(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::identifier(0),
            Achievement::Ruler => achievements::ruler::Ruler::identifier(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::identifier(0),
            Achievement::Warlord => achievements::warlord::Warlord::identifier(0),
        }
    }

    #[inline]
    fn quest(self: Achievement) -> felt252 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::quest(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::quest(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::quest(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::quest(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::quest(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::quest(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::quest(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::quest(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::quest(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::quest(2),
            Achievement::BreederI => achievements::breeder::Breeder::quest(0),
            Achievement::BreederII => achievements::breeder::Breeder::quest(1),
            Achievement::BreederIII => achievements::breeder::Breeder::quest(2),
            Achievement::StrategistI => achievements::strategist::Strategist::quest(0),
            Achievement::StrategistII => achievements::strategist::Strategist::quest(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::quest(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::quest(0),
            Achievement::Ruler => achievements::ruler::Ruler::quest(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::quest(0),
            Achievement::Warlord => achievements::warlord::Warlord::quest(0),
        }
    }

    #[inline]
    fn hidden(self: Achievement) -> bool {
        match self {
            Achievement::None => true,
            Achievement::Squire => achievements::squire::Squire::hidden(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::hidden(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::hidden(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::hidden(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::hidden(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::hidden(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::hidden(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::hidden(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::hidden(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::hidden(2),
            Achievement::BreederI => achievements::breeder::Breeder::hidden(0),
            Achievement::BreederII => achievements::breeder::Breeder::hidden(1),
            Achievement::BreederIII => achievements::breeder::Breeder::hidden(2),
            Achievement::StrategistI => achievements::strategist::Strategist::hidden(0),
            Achievement::StrategistII => achievements::strategist::Strategist::hidden(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::hidden(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::hidden(0),
            Achievement::Ruler => achievements::ruler::Ruler::hidden(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::hidden(0),
            Achievement::Warlord => achievements::warlord::Warlord::hidden(0),
        }
    }

    #[inline]
    fn points(self: Achievement) -> u16 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::points(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::points(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::points(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::points(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::points(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::points(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::points(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::points(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::points(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::points(2),
            Achievement::BreederI => achievements::breeder::Breeder::points(0),
            Achievement::BreederII => achievements::breeder::Breeder::points(1),
            Achievement::BreederIII => achievements::breeder::Breeder::points(2),
            Achievement::StrategistI => achievements::strategist::Strategist::points(0),
            Achievement::StrategistII => achievements::strategist::Strategist::points(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::points(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::points(0),
            Achievement::Ruler => achievements::ruler::Ruler::points(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::points(0),
            Achievement::Warlord => achievements::warlord::Warlord::points(0),
        }
    }

    #[inline]
    fn total(self: Achievement) -> u32 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::total(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::total(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::total(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::total(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::total(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::total(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::total(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::total(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::total(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::total(2),
            Achievement::BreederI => achievements::breeder::Breeder::total(0),
            Achievement::BreederII => achievements::breeder::Breeder::total(1),
            Achievement::BreederIII => achievements::breeder::Breeder::total(2),
            Achievement::StrategistI => achievements::strategist::Strategist::total(0),
            Achievement::StrategistII => achievements::strategist::Strategist::total(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::total(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::total(0),
            Achievement::Ruler => achievements::ruler::Ruler::total(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::total(0),
            Achievement::Warlord => achievements::warlord::Warlord::total(0),
        }
    }

    #[inline]
    fn title(self: Achievement) -> felt252 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::title(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::title(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::title(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::title(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::title(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::title(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::title(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::title(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::title(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::title(2),
            Achievement::BreederI => achievements::breeder::Breeder::title(0),
            Achievement::BreederII => achievements::breeder::Breeder::title(1),
            Achievement::BreederIII => achievements::breeder::Breeder::title(2),
            Achievement::StrategistI => achievements::strategist::Strategist::title(0),
            Achievement::StrategistII => achievements::strategist::Strategist::title(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::title(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::title(0),
            Achievement::Ruler => achievements::ruler::Ruler::title(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::title(0),
            Achievement::Warlord => achievements::warlord::Warlord::title(0),
        }
    }

    #[inline]
    fn description(self: Achievement) -> ByteArray {
        match self {
            Achievement::None => "",
            Achievement::Squire => achievements::squire::Squire::description(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::description(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::description(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::description(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::description(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::description(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::description(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::description(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::description(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::description(2),
            Achievement::BreederI => achievements::breeder::Breeder::description(0),
            Achievement::BreederII => achievements::breeder::Breeder::description(1),
            Achievement::BreederIII => achievements::breeder::Breeder::description(2),
            Achievement::StrategistI => achievements::strategist::Strategist::description(0),
            Achievement::StrategistII => achievements::strategist::Strategist::description(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::description(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::description(0),
            Achievement::Ruler => achievements::ruler::Ruler::description(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::description(0),
            Achievement::Warlord => achievements::warlord::Warlord::description(0),
        }
    }

    #[inline]
    fn icon(self: Achievement) -> felt252 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => achievements::squire::Squire::icon(0),
            Achievement::ExplorerI => achievements::explorer::Explorer::icon(0),
            Achievement::ExplorerII => achievements::explorer::Explorer::icon(1),
            Achievement::ExplorerIII => achievements::explorer::Explorer::icon(2),
            Achievement::BattlelordI => achievements::battlelord::Battlelord::icon(0),
            Achievement::BattlelordII => achievements::battlelord::Battlelord::icon(1),
            Achievement::BattlelordIII => achievements::battlelord::Battlelord::icon(2),
            Achievement::ConquerorI => achievements::conqueror::Conqueror::icon(0),
            Achievement::ConquerorII => achievements::conqueror::Conqueror::icon(1),
            Achievement::ConquerorIII => achievements::conqueror::Conqueror::icon(2),
            Achievement::BreederI => achievements::breeder::Breeder::icon(0),
            Achievement::BreederII => achievements::breeder::Breeder::icon(1),
            Achievement::BreederIII => achievements::breeder::Breeder::icon(2),
            Achievement::StrategistI => achievements::strategist::Strategist::icon(0),
            Achievement::StrategistII => achievements::strategist::Strategist::icon(1),
            Achievement::StrategistIII => achievements::strategist::Strategist::icon(2),
            Achievement::Opportunist => achievements::opportunist::Opportunist::icon(0),
            Achievement::Ruler => achievements::ruler::Ruler::icon(0),
            Achievement::Maximalist => achievements::maximalist::Maximalist::icon(0),
            Achievement::Warlord => achievements::warlord::Warlord::icon(0),
        }
    }
}

impl IntoAchievementU8 of core::Into<Achievement, u8> {
    #[inline]
    fn into(self: Achievement) -> u8 {
        match self {
            Achievement::None => 0,
            Achievement::Squire => 1,
            Achievement::ExplorerI => 2,
            Achievement::ExplorerII => 3,
            Achievement::ExplorerIII => 4,
            Achievement::BattlelordI => 5,
            Achievement::BattlelordII => 6,
            Achievement::BattlelordIII => 7,
            Achievement::ConquerorI => 8,
            Achievement::ConquerorII => 9,
            Achievement::ConquerorIII => 10,
            Achievement::BreederI => 11,
            Achievement::BreederII => 12,
            Achievement::BreederIII => 13,
            Achievement::StrategistI => 14,
            Achievement::StrategistII => 15,
            Achievement::StrategistIII => 16,
            Achievement::Opportunist => 17,
            Achievement::Ruler => 18,
            Achievement::Maximalist => 19,
            Achievement::Warlord => 20,
        }
    }
}

impl IntoU8Achievement of core::Into<u8, Achievement> {
    #[inline]
    fn into(self: u8) -> Achievement {
        let card: felt252 = self.into();
        match card {
            0 => Achievement::None,
            1 => Achievement::Squire,
            2 => Achievement::ExplorerI,
            3 => Achievement::ExplorerII,
            4 => Achievement::ExplorerIII,
            5 => Achievement::BattlelordI,
            6 => Achievement::BattlelordII,
            7 => Achievement::BattlelordIII,
            8 => Achievement::ConquerorI,
            9 => Achievement::ConquerorII,
            10 => Achievement::ConquerorIII,
            11 => Achievement::BreederI,
            12 => Achievement::BreederII,
            13 => Achievement::BreederIII,
            14 => Achievement::StrategistI,
            15 => Achievement::StrategistII,
            16 => Achievement::StrategistIII,
            17 => Achievement::Opportunist,
            18 => Achievement::Ruler,
            19 => Achievement::Maximalist,
            20 => Achievement::Warlord,
            _ => Achievement::None,
        }
    }
}

impl AchievementPrint of core::debug::PrintTrait<Achievement> {
    #[inline]
    fn print(self: Achievement) {
        self.identifier().print();
    }
}

