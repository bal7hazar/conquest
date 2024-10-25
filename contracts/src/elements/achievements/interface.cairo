use conquest::models::tile::Tile;
use conquest::types::quest::{Quest, QuestTrait};

trait AchievementTrait {
    fn identifier(level: u8) -> felt252;
    fn quest(level: u8) -> felt252;
    fn hidden(level: u8) -> bool;
    fn points(level: u8) -> u16;
    fn total(level: u8) -> u32;
    fn title(level: u8) -> felt252;
    fn description(level: u8) -> ByteArray;
    fn icon(level: u8) -> felt252;
}
