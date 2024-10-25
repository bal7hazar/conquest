use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Maximalist of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'MAXIMALIST'
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Maximalist.identifier()
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        true
    }

    #[inline]
    fn points(level: u8) -> u16 {
        90
    }

    #[inline]
    fn total(level: u8) -> u32 {
        1
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        'Maximalist'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Max out the Realms levels."
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-castle'
    }
}
