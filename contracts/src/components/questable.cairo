#[starknet::component]
mod QuestableComponent {
    // Starknet imports

    use starknet::info::{get_caller_address, get_contract_address, get_block_timestamp};

    // Dojo imports

    use dojo::world::IWorldDispatcher;
    use dojo::contract::{IContract, IContractDispatcher, IContractDispatcherTrait};

    // External imports

    use achievement::components::achievable::AchievableComponent;
    use achievement::components::achievable::AchievableComponent::InternalImpl as AchievableInternalImpl;

    // Internal imports

    use conquest::store::{Store, StoreTrait};
    use conquest::models::player::{Player, PlayerTrait, PlayerAssert};
    use conquest::models::tile::{Tile, TileTrait, TileAssert};
    use conquest::types::quest::{Quest, QuestTrait, QUEST_COUNT};

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
        +IContract<TContractState>,
        impl InternalImpl: AchievableComponent::HasComponent<TContractState>,
    > of InternalTrait<TContractState> {
        fn initialize(self: @ComponentState<TContractState>, world: IWorldDispatcher,) {
            // [Event] Emit quest creation events
            let mut achievable = get_dep_component!(self, InternalImpl);
            let mut quest_id: u8 = QUEST_COUNT;
            while quest_id > 0 {
                let quest: Quest = quest_id.into();
                achievable
                    .create(
                        world,
                        identifier: quest.identifier(),
                        hidden: quest.hidden(),
                        points: quest.points(),
                        total: quest.total(),
                        title: quest.title(),
                        hidden_title: quest.hidden_title(),
                        description: quest.description(),
                        hidden_description: quest.hidden_description(),
                        image_uri: quest.image_uri(),
                        icon: quest.icon().into(),
                    );
                quest_id -= 1;
            }
        }

        fn verify(
            self: @ComponentState<TContractState>,
            world: IWorldDispatcher,
            quest: Quest,
            ref tile_ids: Array<u32>,
        ) {
            // [Setup] Datastore
            let store: Store = StoreTrait::new(world);

            // [Check] Player exists
            let player_id: felt252 = get_caller_address().into();
            let mut player = store.get_player(player_id);
            player.assert_is_created();

            // [Compute] Tiles
            let mut tiles: Array<Tile> = array![];
            while let Option::Some(tile_id) = tile_ids.pop_front() {
                let tile = store.get_tile(tile_id);
                tiles.append(tile);
            };

            // [Effect] Verify quest completion
            let (progress, _total) = quest.completion(ref tiles, player_id);

            // [Event] Emit quest completion event
            let mut achievable = get_dep_component!(self, InternalImpl);
            achievable
                .update(
                    world,
                    identifier: quest.identifier(),
                    player_id: player_id,
                    progress: progress.into(),
                );
        }

        fn validate(self: @ComponentState<TContractState>, world: IWorldDispatcher, quest: Quest,) {
            // [Setup] Datastore
            let store: Store = StoreTrait::new(world);

            // [Check] Player exists
            let player_id: felt252 = get_caller_address().into();
            let mut player = store.get_player(player_id);
            player.assert_is_created();

            // [Event] Emit quest completion event
            let mut achievable = get_dep_component!(self, InternalImpl);
            achievable
                .update(world, identifier: quest.identifier(), player_id: player_id, progress: 1,);
        }
    }
}
