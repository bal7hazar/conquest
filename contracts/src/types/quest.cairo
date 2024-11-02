// External imports

use bushido_trophy::types::task::{Task, TaskTrait};

// Internal imports

use conquest::elements::quests;
use conquest::models::tile::Tile;

// Constants

pub const QUEST_COUNT: u8 = 10;

#[derive(Copy, Drop)]
enum Quest {
    None,
    Squire,
    Explorer,
    Battlelord,
    Conqueror,
    Breeder,
    Strategist,
    Opportunist,
    Ruler,
    Maximalist,
    Warlord,
}

#[generate_trait]
impl QuestImpl of QuestTrait {
    #[inline]
    fn identifier(self: Quest) -> felt252 {
        match self {
            Quest::None => 0,
            Quest::Squire => quests::squire::Squire::identifier(),
            Quest::Explorer => quests::explorer::Explorer::identifier(),
            Quest::Battlelord => quests::battlelord::Battlelord::identifier(),
            Quest::Conqueror => quests::conqueror::Conqueror::identifier(),
            Quest::Breeder => quests::breeder::Breeder::identifier(),
            Quest::Strategist => quests::strategist::Strategist::identifier(),
            Quest::Opportunist => quests::opportunist::Opportunist::identifier(),
            Quest::Ruler => quests::ruler::Ruler::identifier(),
            Quest::Maximalist => quests::maximalist::Maximalist::identifier(),
            Quest::Warlord => quests::warlord::Warlord::identifier(),
        }
    }

    #[inline]
    fn description(self: Quest, difficulty: u8, count: u32) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Squire => quests::squire::Squire::description(difficulty, count),
            Quest::Explorer => quests::explorer::Explorer::description(difficulty, count),
            Quest::Battlelord => quests::battlelord::Battlelord::description(difficulty, count),
            Quest::Conqueror => quests::conqueror::Conqueror::description(difficulty, count),
            Quest::Breeder => quests::breeder::Breeder::description(difficulty, count),
            Quest::Strategist => quests::strategist::Strategist::description(difficulty, count),
            Quest::Opportunist => quests::opportunist::Opportunist::description(difficulty, count),
            Quest::Ruler => quests::ruler::Ruler::description(difficulty, count),
            Quest::Maximalist => quests::maximalist::Maximalist::description(difficulty, count),
            Quest::Warlord => quests::warlord::Warlord::description(difficulty, count),
        }
    }

    #[inline]
    fn tasks(self: Quest, difficulty: u8, count: u32) -> Span<Task> {
        let task_id: felt252 = self.identifier();
        let description: ByteArray = self.description(difficulty, count);
        array![TaskTrait::new(task_id, count, description)].span()
    }
}

impl IntoQuestU8 of core::Into<Quest, u8> {
    #[inline]
    fn into(self: Quest) -> u8 {
        match self {
            Quest::None => 0,
            Quest::Squire => 1,
            Quest::Explorer => 2,
            Quest::Battlelord => 3,
            Quest::Conqueror => 4,
            Quest::Breeder => 5,
            Quest::Strategist => 6,
            Quest::Opportunist => 7,
            Quest::Ruler => 8,
            Quest::Maximalist => 9,
            Quest::Warlord => 10,
        }
    }
}

impl IntoU8Quest of core::Into<u8, Quest> {
    #[inline]
    fn into(self: u8) -> Quest {
        let card: felt252 = self.into();
        match card {
            0 => Quest::None,
            1 => Quest::Squire,
            2 => Quest::Explorer,
            3 => Quest::Battlelord,
            4 => Quest::Conqueror,
            5 => Quest::Breeder,
            6 => Quest::Strategist,
            7 => Quest::Opportunist,
            8 => Quest::Ruler,
            9 => Quest::Maximalist,
            10 => Quest::Warlord,
            _ => Quest::None,
        }
    }
}

impl QuestPrint of core::debug::PrintTrait<Quest> {
    #[inline]
    fn print(self: Quest) {
        self.identifier().print();
    }
}

