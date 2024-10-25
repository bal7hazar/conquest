use conquest::elements::achievements::interface::{AchievementTrait, Quest, QuestTrait};


impl Strategist of AchievementTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        match level {
            0 => 'STRATEGIST_I',
            1 => 'STRATEGIST_II',
            2 => 'STRATEGIST_III',
            _ => '',
        }
    }

    #[inline]
    fn quest(level: u8) -> felt252 {
        Quest::Strategist.identifier()
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
        1
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        match level {
            0 => 'Strategist I',
            1 => 'Strategist II',
            2 => 'Strategist III',
            _ => '',
        }
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        match level {
            0 => "Discover a Fragment Mine.",
            1 => "Conquer a Fragment Mine.",
            2 => "Build a Hyperstructure.",
            _ => "",
        }
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        match level {
            0 => 'fa-chess-pawn-piece',
            1 => 'fa-chess-knight-piece',
            2 => 'fa-chess-king-piece',
            _ => '',
        }
    }
}
