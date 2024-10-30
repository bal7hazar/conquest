use conquest::elements::quests::interface::QuestTrait;

impl Battlelord of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'BATTLELORD'
    }

    #[inline]
    fn description(difficulty: u8, count: u32) -> ByteArray {
        match count {
            0 => "",
            1 => "Win 1 battle",
            _ => format!("Win {} battles", count),
        }
    }
}
