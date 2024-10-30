use conquest::elements::quests::interface::QuestTrait;

impl Ruler of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'RULER'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        "Conquer the bank"
    }
}
