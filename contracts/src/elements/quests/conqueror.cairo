use conquest::elements::quests::interface::{QuestTrait, Tile, AchievementIcon};

const CONQUESTS_REQUIRED: u16 = 3;

impl Conqueror of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'CONQUEROR'
    }

    #[inline]
    fn hidden() -> bool {
        false
    }

    #[inline]
    fn points() -> u16 {
        50
    }

    #[inline]
    fn total() -> u32 {
        CONQUESTS_REQUIRED.into()
    }

    #[inline]
    fn title() -> ByteArray {
        "Conqueror"
    }

    #[inline]
    fn hidden_title() -> ByteArray {
        ""
    }

    #[inline]
    fn description() -> ByteArray {
        "Conquer 3 tiles"
    }

    #[inline]
    fn hidden_description() -> ByteArray {
        ""
    }

    #[inline]
    fn image_uri() -> ByteArray {
        "https://storage.googleapis.com/pod_public/1300/177057.jpg"
    }

    #[inline]
    fn icon() -> AchievementIcon {
        AchievementIcon::Khanda
    }

    #[inline]
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16) {
        let mut conquests: u16 = 0;

        loop {
            match tiles.pop_front() {
                Option::Some(tile) => { if tile.player_id == player_id {
                    conquests += 1;
                } },
                Option::None => { break (conquests, CONQUESTS_REQUIRED); }
            }
        }
    }
}
