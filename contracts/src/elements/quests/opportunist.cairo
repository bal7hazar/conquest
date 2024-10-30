use conquest::elements::quests::interface::QuestTrait;

impl Opportunist of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'OPPORTUNIST'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        "Contribute to a Hyperstructure"
    }
}
