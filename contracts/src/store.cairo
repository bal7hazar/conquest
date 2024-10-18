//! Store struct and component management methods.

// Dojo imports

use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};

// Models imports

use conquest::models::index::{PlayerStore, TileStore};
use conquest::models::player::Player;
use conquest::models::tile::Tile;

// Structs

#[derive(Copy, Drop)]
struct Store {
    world: IWorldDispatcher,
}

// Implementations

#[generate_trait]
impl StoreImpl of StoreTrait {
    #[inline]
    fn new(world: IWorldDispatcher) -> Store {
        Store { world: world }
    }

    #[inline]
    fn get_player(self: Store, player_id: felt252) -> Player {
        PlayerStore::get(self.world, player_id)
    }

    #[inline]
    fn get_tile(self: Store, tile_id: u32) -> Tile {
        TileStore::get(self.world, tile_id)
    }

    #[inline]
    fn set_player(self: Store, player: Player) {
        set!(self.world, (player))
    }

    #[inline]
    fn set_tile(self: Store, tile: Tile) {
        set!(self.world, (tile))
    }
}
