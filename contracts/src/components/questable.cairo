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
    use conquest::types::achievement::{Achievement, AchievementTrait, ACHIEVEMENT_COUNT};
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
        +IContract<TContractState>,
        impl InternalImpl: AchievableComponent::HasComponent<TContractState>,
    > of InternalTrait<TContractState> {
        fn initialize(self: @ComponentState<TContractState>, world: IWorldDispatcher,) {
            // [Event] Emit quest creation events
            let mut achievable = get_dep_component!(self, InternalImpl);
            let mut achievement_id: u8 = ACHIEVEMENT_COUNT;
            while achievement_id > 0 {
                let achievement: Achievement = achievement_id.into();
                achievable
                    .create(
                        world,
                        identifier: achievement.identifier(),
                        quest: achievement.quest(),
                        hidden: achievement.hidden(),
                        points: achievement.points(),
                        total: achievement.total(),
                        title: achievement.title(),
                        description: achievement.description(),
                        icon: achievement.icon(),
                    );
                achievement_id -= 1;
            }
        }

        fn assess(self: @ComponentState<TContractState>, world: IWorldDispatcher, quest: Quest,) {
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
