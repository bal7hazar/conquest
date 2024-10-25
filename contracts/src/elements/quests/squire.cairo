use conquest::elements::quests::interface::{QuestTrait, Tile};
use conquest::helpers::dater::Dater;

impl Squire of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'SQUIRE'
    }

    #[inline]
    fn hidden() -> bool {
        false
    }

    #[inline]
    fn points() -> u16 {
        20
    }

    #[inline]
    fn total() -> u32 {
        1
    }

    #[inline]
    fn title() -> ByteArray {
        "Squire"
    }

    #[inline]
    fn hidden_title() -> ByteArray {
        ""
    }

    #[inline]
    fn description() -> ByteArray {
        "Signup to the game"
    }

    #[inline]
    fn hidden_description() -> ByteArray {
        ""
    }

    #[inline]
    fn icon() -> felt252 {
        'fa-dice'
    }

    #[inline]
    fn icon_style() -> felt252 {
        'fa-light'
    }

    #[inline]
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16) {
        (0, 100)
    }
}
