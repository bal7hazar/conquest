use conquest::elements::quests::interface::QuestTrait;

impl Conqueror of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'CONQUEROR'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        match count {
            0 => "",
            1 => "Conquer 1 realm",
            _ => format!("Conquer {} realms", count),
        }
    }
}
