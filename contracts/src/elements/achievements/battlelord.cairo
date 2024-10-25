use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Battlelord of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        match level {
            0 => 'BATTLELORD_I',
            1 => 'BATTLELORD_II',
            2 => 'BATTLELORD_III',
            _ => '',
        }
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Battlelord.identifier()
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        false
    }

    #[inline]
    fn points(level: u8) -> u16 {
        match level {
            0 => 20,
            1 => 40,
            2 => 80,
            _ => 0,
        }
    }

    #[inline]
    fn total(level: u8) -> u32 {
        match level {
            0 => 1,
            1 => 10,
            2 => 100,
            _ => 0,
        }
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        match level {
            0 => 'Battlelord I',
            1 => 'Battlelord II',
            2 => 'Battlelord III',
            _ => '',
        }
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        match level {
            0 => "Win 1 battle.",
            1 => "Win 10 battles.",
            2 => "Win 100 battles.",
            _ => "",
        }
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-helmet-battle'
    }
}
