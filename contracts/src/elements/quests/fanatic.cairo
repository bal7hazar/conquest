use conquest::elements::quests::interface::{QuestTrait, Tile, AchievementIcon};
use conquest::helpers::dater::Dater;

const CONSECUTIVE_MINUTES_REQUIRED: u16 = 3;

impl Fanatic of QuestTrait {
    #[inline]
    fn identifier() -> felt252 {
        'FANATIC'
    }

    #[inline]
    fn hidden() -> bool {
        true
    }

    #[inline]
    fn points() -> u16 {
        100
    }

    #[inline]
    fn total() -> u32 {
        CONSECUTIVE_MINUTES_REQUIRED.into()
    }

    #[inline]
    fn title() -> ByteArray {
        "Fanatic"
    }

    #[inline]
    fn hidden_title() -> ByteArray {
        "Fanatic"
    }

    #[inline]
    fn description() -> ByteArray {
        "Play 3 consecutive minutes"
    }

    #[inline]
    fn hidden_description() -> ByteArray {
        ""
    }

    #[inline]
    fn image_uri() -> ByteArray {
        "https://storage.googleapis.com/pod_public/1300/200887.jpg"
    }

    #[inline]
    fn icon() -> AchievementIcon {
        AchievementIcon::Bolt
    }

    #[inline]
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16) {
        let mut consecutive_minutes: u16 = 0;
        let mut previous_minute: u64 = 0;

        loop {
            match tiles.pop_front() {
                Option::Some(tile) => {
                    let minute = Dater::minute_from(tile.time);
                    if tile.player_id == player_id
                        && (consecutive_minutes == 0 || minute == previous_minute + 1) {
                        consecutive_minutes += 1;
                        previous_minute = minute;
                    } else {
                        break (consecutive_minutes, CONSECUTIVE_MINUTES_REQUIRED);
                    };
                },
                Option::None => { break (consecutive_minutes, CONSECUTIVE_MINUTES_REQUIRED); }
            }
        }
    }
}
