use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Warlord of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'WARLORD'
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Warlord.identifier()
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        false
    }

    #[inline]
    fn points(level: u8) -> u16 {
        100
    }

    #[inline]
    fn total(level: u8) -> u32 {
        1
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        'Warlord'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Claim the victory."
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-axe-battle'
    }
}
