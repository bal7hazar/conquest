use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Conqueror of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        match level {
            0 => 'CONQUEROR_I',
            1 => 'CONQUEROR_II',
            2 => 'CONQUEROR_III',
            _ => '',
        }
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Conqueror.identifier()
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
            1 => 5,
            2 => 10,
            _ => 0,
        }
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        match level {
            0 => 'Conqueror I',
            1 => 'Conqueror II',
            2 => 'Conqueror III',
            _ => '',
        }
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        match level {
            0 => "Conquer 1 realm.",
            1 => "Conquer 5 realms.",
            2 => "Conquer 10 realms.",
            _ => "",
        }
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        match level {
            0 => 'fa-sword',
            1 => 'fa-swords',
            2 => 'fa-khanda',
            _ => '',
        }
    }
}
