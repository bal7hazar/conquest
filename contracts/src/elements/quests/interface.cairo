use conquest::models::tile::Tile;
use achievement::types::icon::AchievementIcon;

trait QuestTrait {
    fn identifier() -> felt252;
    fn hidden() -> bool;
    fn points() -> u16;
    fn total() -> u32;
    fn title() -> ByteArray;
    fn hidden_title() -> ByteArray;
    fn description() -> ByteArray;
    fn hidden_description() -> ByteArray;
    fn image_uri() -> ByteArray;
    fn icon() -> AchievementIcon;
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16);
}
