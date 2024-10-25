use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Ruler of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'RULER'
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Ruler.identifier()
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        false
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
        'Ruler'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Conquer the bank."
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-scale-balanced'
    }
}
