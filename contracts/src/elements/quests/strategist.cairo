use conquest::elements::quests::interface::QuestTrait;

impl Strategist of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'STRATEGIST'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        match difficulty {
            0 => "Discover a Fragment Mine",
            1 => "Conquer a Fragment Mine",
            2 => "Build a Hyperstructure",
            _ => "",
        }
    }
}
