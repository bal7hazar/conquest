use conquest::elements::quests::interface::QuestTrait;

impl Explorer of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'EXPLORER'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        format!("Explore {} tiles", count)
    }
}
