use conquest::elements::quests;
use conquest::models::tile::Tile;
use achievement::types::icon::AchievementIcon;

// Constants

pub const QUEST_COUNT: u8 = 3;

#[derive(Copy, Drop)]
enum Quest {
    None,
    Conqueror,
    Fanatic,
    Squire,
}

#[generate_trait]
impl QuestImpl of QuestTrait {
    #[inline]
    fn identifier(self: Quest) -> felt252 {
        match self {
            Quest::None => 0,
            Quest::Conqueror => quests::conqueror::Conqueror::identifier(),
            Quest::Fanatic => quests::fanatic::Fanatic::identifier(),
            Quest::Squire => quests::squire::Squire::identifier(),
        }
    }

    #[inline]
    fn hidden(self: Quest) -> bool {
        match self {
            Quest::None => true,
            Quest::Conqueror => quests::conqueror::Conqueror::hidden(),
            Quest::Fanatic => quests::fanatic::Fanatic::hidden(),
            Quest::Squire => quests::squire::Squire::hidden(),
        }
    }

    #[inline]
    fn points(self: Quest) -> u16 {
        match self {
            Quest::None => 0,
            Quest::Conqueror => quests::conqueror::Conqueror::points(),
            Quest::Fanatic => quests::fanatic::Fanatic::points(),
            Quest::Squire => quests::squire::Squire::points(),
        }
    }

    #[inline]
    fn total(self: Quest) -> u32 {
        match self {
            Quest::None => 0,
            Quest::Conqueror => quests::conqueror::Conqueror::total(),
            Quest::Fanatic => quests::fanatic::Fanatic::total(),
            Quest::Squire => quests::squire::Squire::total(),
        }
    }

    #[inline]
    fn title(self: Quest) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Conqueror => quests::conqueror::Conqueror::title(),
            Quest::Fanatic => quests::fanatic::Fanatic::title(),
            Quest::Squire => quests::squire::Squire::title(),
        }
    }

    #[inline]
    fn hidden_title(self: Quest) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Conqueror => quests::conqueror::Conqueror::hidden_title(),
            Quest::Fanatic => quests::fanatic::Fanatic::hidden_title(),
            Quest::Squire => quests::squire::Squire::hidden_title(),
        }
    }

    #[inline]
    fn description(self: Quest) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Conqueror => quests::conqueror::Conqueror::description(),
            Quest::Fanatic => quests::fanatic::Fanatic::description(),
            Quest::Squire => quests::squire::Squire::description(),
        }
    }

    #[inline]
    fn hidden_description(self: Quest) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Conqueror => quests::conqueror::Conqueror::hidden_description(),
            Quest::Fanatic => quests::fanatic::Fanatic::hidden_description(),
            Quest::Squire => quests::squire::Squire::hidden_description(),
        }
    }

    #[inline]
    fn image_uri(self: Quest) -> ByteArray {
        match self {
            Quest::None => "",
            Quest::Conqueror => quests::conqueror::Conqueror::image_uri(),
            Quest::Fanatic => quests::fanatic::Fanatic::image_uri(),
            Quest::Squire => quests::squire::Squire::image_uri(),
        }
    }

    #[inline]
    fn icon(self: Quest) -> AchievementIcon {
        match self {
            Quest::None => AchievementIcon::None,
            Quest::Conqueror => quests::conqueror::Conqueror::icon(),
            Quest::Fanatic => quests::fanatic::Fanatic::icon(),
            Quest::Squire => quests::squire::Squire::icon(),
        }
    }

    #[inline]
    fn completion(self: Quest, ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16) {
        match self {
            Quest::None => (0, 100),
            Quest::Conqueror => quests::conqueror::Conqueror::completion(ref tiles, player_id),
            Quest::Fanatic => quests::fanatic::Fanatic::completion(ref tiles, player_id),
            Quest::Squire => quests::squire::Squire::completion(ref tiles, player_id),
        }
    }
}

impl IntoQuestFelt252 of core::Into<Quest, felt252> {
    #[inline]
    fn into(self: Quest) -> felt252 {
        match self {
            Quest::None => 'NONE',
            Quest::Conqueror => 'CONQUEROR',
            Quest::Fanatic => 'FANATIC',
            Quest::Squire => 'SQUIRE',
        }
    }
}

impl IntoQuestU8 of core::Into<Quest, u8> {
    #[inline]
    fn into(self: Quest) -> u8 {
        match self {
            Quest::None => 0,
            Quest::Conqueror => 1,
            Quest::Fanatic => 2,
            Quest::Squire => 3,
        }
    }
}

impl IntoU8Quest of core::Into<u8, Quest> {
    #[inline]
    fn into(self: u8) -> Quest {
        let card: felt252 = self.into();
        match card {
            0 => Quest::None,
            1 => Quest::Conqueror,
            2 => Quest::Fanatic,
            3 => Quest::Squire,
            _ => Quest::None,
        }
    }
}

impl QuestPrint of core::debug::PrintTrait<Quest> {
    #[inline]
    fn print(self: Quest) {
        let felt: felt252 = self.into();
        felt.print();
    }
}

