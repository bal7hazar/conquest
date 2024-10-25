use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Explorer of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        match level {
            0 => 'EXPLORER_I',
            1 => 'EXPLORER_II',
            2 => 'EXPLORER_III',
            _ => '',
        }
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Explorer.identifier()
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
            0 => 10,
            1 => 100,
            2 => 1000,
            _ => 0,
        }
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        match level {
            0 => 'Explorer I',
            1 => 'Explorer II',
            2 => 'Explorer III',
            _ => '',
        }
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        match level {
            0 => "Explore 10 tiles.",
            1 => "Explore 100 tiles.",
            2 => "Explore 1000 tiles.",
            _ => "",
        }
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        match level {
            0 => 'fa-mountain',
            1 => 'fa-mountains',
            2 => 'fa-mountain-sun',
            _ => '',
        }
    }
}
