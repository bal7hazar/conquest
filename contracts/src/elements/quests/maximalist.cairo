use conquest::elements::quests::interface::QuestTrait;

impl Maximalist of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'MAXIMALIST'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        "Max out the Realms levels"
    }
}
