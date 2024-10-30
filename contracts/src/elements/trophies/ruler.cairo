use conquest::elements::trophies::interface::{TrophyTrait, Task, Quest, QuestTrait};

impl Ruler of TrophyTrait {
    #[inline]
    fn identifier(level: u8) -> felt252 {
        'RULER'
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
        90
    }

    #[inline]
    fn group() -> felt252 {
        'Ruler'
    }

    #[inline]
    fn icon(level: u8) -> felt252 {
        'fa-scale-balanced'
    }

    #[inline]
    fn title(level: u8) -> felt252 {
        'Ruler'
    }

    #[inline]
    fn description(level: u8) -> ByteArray {
        "Whoever has the gold makes the rules"
    }

    #[inline]
    fn tasks(level: u8) -> Span<Task> {
        let difficulty: u8 = 0;
        let count: u32 = 1;
        Quest::Ruler.tasks(difficulty, count)
    }
}