use conquest::elements::quests::interface::{QuestTrait, Tile};
use conquest::helpers::dater::Dater;

impl Ruler of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'RULER'
    }

    #[inline]
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16) {
        (0, 100)
    }
}
