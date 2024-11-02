#[starknet::component]
mod SignableComponent {
    // Core imports

    use core::debug::PrintTrait;

    // Starknet imports

    use starknet::info::get_caller_address;

    // Dojo imports

    use dojo::world::WorldStorage;

    // Internal imports

    use conquest::store::{Store, StoreTrait};
    use conquest::models::player::{Player, PlayerTrait, PlayerAssert};

    // Errors

    mod errors {}

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
        fn signup(self: @ComponentState<TContractState>, world: WorldStorage, name: felt252,) {
            // [Setup] Datastore
            let mut store: Store = StoreTrait::new(world);

            // [Check] Player does not exist
            let player_id: felt252 = get_caller_address().into();
            let player = store.get_player(player_id);
            player.assert_not_created();

            // [Effect] Create player
            let player = PlayerTrait::new(player_id, name);

            // [Effect] Set player
            store.set_player(player);
        }
    }
}
