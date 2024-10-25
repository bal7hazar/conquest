use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Squire of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'SQUIRE'
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Squire.identifier()
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        false
    }

    #[inline]
    fn points(level: u8) -> u16 {
        10
    }

    #[inline]
    fn total(level: u8) -> u32 {
        1
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        'Squire'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Complete the quests."
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-seedling'
    }
}
