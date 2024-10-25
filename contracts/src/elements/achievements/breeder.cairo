use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Breeder of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        match level {
            0 => 'BREEDER_I',
            1 => 'BREEDER_II',
            2 => 'BREEDER_III',
            _ => '',
        }
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Breeder.identifier()
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
            0 => 1000,
            1 => 10000,
            2 => 100000,
            _ => 0,
        }
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        match level {
            0 => 'Breeder I',
            1 => 'Breeder II',
            2 => 'Breeder III',
            _ => '',
        }
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        match level {
            0 => "Consume a total of 1,000 donkeys.",
            1 => "Consume a total of 10,000 donkeys.",
            2 => "Consume a total of 100,000 donkeys.",
            _ => "",
        }
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-democrat'
    }
}
