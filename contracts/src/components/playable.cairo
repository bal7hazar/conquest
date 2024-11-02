#[starknet::component]
mod PlayableComponent {
    // Starknet imports

    use starknet::info::{get_caller_address, get_block_timestamp};

    // Dojo imports

    use dojo::world::{WorldStorage, IWorldDispatcherTrait};

    // Internal imports

    use conquest::store::{Store, StoreTrait};
    use conquest::models::player::{Player, PlayerTrait, PlayerAssert};
    use conquest::models::tile::{Tile, TileTrait, TileAssert};

    // Storage

    #[storage]
    struct Storage {}

    // Events

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    #[generate_trait]
    impl InternalImpl<
        TContractState, +HasComponent<TContractState>
    > of InternalTrait<TContractState> {
        fn conquest(self: @ComponentState<TContractState>, world: WorldStorage) {
            // [Setup] Datastore
            let mut store: Store = StoreTrait::new(world);

            // [Check] Player exists
            let player_id: felt252 = get_caller_address().into();
            let player = store.get_player(player_id);
            player.assert_is_created();

            // [Effect] Create tile
            let tile_id: u32 = world.dispatcher.uuid();
            let mut tile: Tile = TileTrait::new(tile_id);

            // [Effect] Own tile
            let time = get_block_timestamp();
            tile.own(player_id, time);

            // [Effect] Update entities
            store.set_tile(tile);
        }
    }
}
