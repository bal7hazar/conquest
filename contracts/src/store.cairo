//! Store struct and component management methods.

// Dojo imports

use dojo::world::WorldStorage;
use dojo::model::ModelStorage;

// Models imports

use conquest::models::player::Player;
use conquest::models::tile::Tile;

// Structs

#[derive(Copy, Drop)]
struct Store {
    world: WorldStorage,
}

// Implementations

#[generate_trait]
impl StoreImpl of StoreTrait {
    #[inline]
    fn new(world: WorldStorage) -> Store {
        Store { world: world }
    }

    #[inline]
    fn get_player(self: Store, player_id: felt252) -> Player {
        self.world.read_model(player_id)
    }

    #[inline]
    fn get_tile(self: Store, tile_id: u32) -> Tile {
        self.world.read_model(tile_id)
    }

    #[inline]
    fn set_player(ref self: Store, player: Player) {
        self.world.write_model(@player);
    }

    #[inline]
    fn set_tile(ref self: Store, tile: Tile) {
        self.world.write_model(@tile);
    }
}
