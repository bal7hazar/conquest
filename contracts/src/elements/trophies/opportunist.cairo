use conquest::elements::trophies::interface::{TrophyTrait, Task, Quest, QuestTrait};

impl Opportunist of TrophyTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'OPPORTUNIST'
    }

    #[inline]
    fn hidden(level: u8) -> bool {
        false
    }

    #[inline]
    fn index(level: u8) -> u8 {
        level
    }

    #[inline]
    fn points(level: u8) -> u16 {
        10
    }

    #[inline]
    fn group() -> felt252 {
        'Opportunist'
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-lightbulb-on'
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        'Opportunist'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Strike while the iron is hot"
    }

    #[inline]
    fn tasks(level: u8) -> Span<Task> {
        let difficulty: u8 = 0;
        let count: u32 = 1;
        Quest::Opportunist.tasks(difficulty, count)
    }
}
