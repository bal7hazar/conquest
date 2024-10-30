use conquest::elements::quests::interface::QuestTrait;

impl Squire of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'SQUIRE'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        "Complete the quests"
    }
}
