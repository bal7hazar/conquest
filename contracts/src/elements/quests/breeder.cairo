use conquest::elements::quests::interface::QuestTrait;

impl Breeder of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'BREEDER'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        format!("Consume a total of {} donkeys", count)
    }
}
