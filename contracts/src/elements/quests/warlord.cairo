use conquest::elements::quests::interface::QuestTrait;

impl Warlord of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'WARLORD'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        "Claim the victory"
    }
}
