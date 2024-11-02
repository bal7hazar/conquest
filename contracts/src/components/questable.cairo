#[starknet::component]
mod QuestableComponent {
    // Starknet imports

    use starknet::info::{get_caller_address, get_contract_address, get_block_timestamp};

    // Dojo imports

    use dojo::world::WorldStorage;

    // External imports

    use bushido_trophy::components::achievable::AchievableComponent;
    use bushido_trophy::components::achievable::AchievableComponent::InternalImpl as AchievableInternalImpl;

    // Internal imports

    use conquest::store::{Store, StoreTrait};
    use conquest::models::player::{Player, PlayerTrait, PlayerAssert};
    use conquest::models::tile::{Tile, TileTrait, TileAssert};
    use conquest::types::trophy::{Trophy, TrophyTrait, TROPHY_COUNT};
    use conquest::types::quest::{Quest, QuestTrait};


    // Storage

    #[storage]
    struct Storage {}

    // Events

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {}

    #[generate_trait]
    impl InternalImpl<
        TContractState,
        +HasComponent<TContractState>,
        impl InternalImpl: AchievableComponent::HasComponent<TContractState>,
    > of InternalTrait<TContractState> {
        fn initialize(self: @ComponentState<TContractState>, world: WorldStorage,) {
            // [Event] Emit quest creation events
            let mut achievable = get_dep_component!(self, InternalImpl);
            let mut trophy_id: u8 = TROPHY_COUNT;
            while trophy_id > 0 {
                let trophy: Trophy = trophy_id.into();
                achievable
                    .create(
                        world,
                        id: trophy.identifier(),
                        hidden: trophy.hidden(),
                        index: trophy.index(),
                        points: trophy.points(),
                        group: trophy.group(),
                        icon: trophy.icon(),
                        title: trophy.title(),
                        description: trophy.description(),
                        tasks: trophy.tasks(),
                        data: trophy.data(),
                    );
                trophy_id -= 1;
            }
        }

        fn assess(self: @ComponentState<TContractState>, world: WorldStorage, quest: Quest,) {
            // [Setup] Datastore
            let store: Store = StoreTrait::new(world);

            // [Check] Player exists
            let player_id: felt252 = get_caller_address().into();
            let mut player = store.get_player(player_id);
            player.assert_is_created();

            // [Event] Emit quest completion event
            let mut achievable = get_dep_component!(self, InternalImpl);
            achievable.update(world, player_id, quest.identifier(), count: 1,);
        }
    }
}
