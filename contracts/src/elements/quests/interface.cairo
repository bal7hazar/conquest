use conquest::models::tile::Tile;

trait QuestTrait {
    fn identifier() -> felt252;
    fn completion(ref tiles: Array<Tile>, player_id: felt252) -> (u16, u16);
}
