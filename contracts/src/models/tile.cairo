// Internal imports

use conquest::models::index::Tile;

mod errors {
    const TILE_NOT_OWNED: felt252 = 'Tile: is not owned';
    const TILE_ALREADY_OWNED: felt252 = 'Tile: already owned';
}

#[generate_trait]
impl TileImpl of TileTrait {
    #[inline]
    fn new(id: u32) -> Tile {
        Tile { id, player_id: 0, time: 0 }
    }

    #[inline]
    fn own(ref self: Tile, player_id: felt252, time: u64) {
        self.player_id = player_id;
        self.time = time;
    }
}

#[generate_trait]
impl TileAssert of AssertTrait {
    #[inline]
    fn assert_not_owned(self: Tile, player_id: felt252) {
        assert(player_id != self.player_id, errors::TILE_ALREADY_OWNED);
    }
}

#[cfg(test)]
mod tests {
    // Local imports

    use super::{Tile, TileTrait};

    // Constants

    const PLAYER_ID: felt252 = 'ID';
    const TILE_ID: u32 = 42;

    #[test]
    fn test_tile_new() {
        let tile = TileTrait::new(TILE_ID);
        assert_eq!(tile.id, TILE_ID);
        assert_eq!(tile.player_id, 0);
    }
}
