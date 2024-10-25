// Interfaces

#[starknet::interface]
trait IActions<TContractState> {
    fn signup(self: @TContractState, name: felt252,);
    fn conquest(self: @TContractState);
    fn verify(self: @TContractState, quest: u8);
}

#[dojo::contract]
mod Actions {
    // Component imports

    use achievement::components::achievable::AchievableComponent;
    use conquest::components::signable::SignableComponent;
    use conquest::components::playable::PlayableComponent;
    use conquest::components::questable::QuestableComponent;

    // Internal imports
    use conquest::types::quest::Quest;

    // Local imports

    use super::IActions;

    // Components

    component!(path: AchievableComponent, storage: achievable, event: AchievableEvent);
    impl AchievableInternalImpl = AchievableComponent::InternalImpl<ContractState>;
    component!(path: SignableComponent, storage: signable, event: SignableEvent);
    impl SignableInternalImpl = SignableComponent::InternalImpl<ContractState>;
    component!(path: PlayableComponent, storage: playable, event: PlayableEvent);
    impl PlayableInternalImpl = PlayableComponent::InternalImpl<ContractState>;
    component!(path: QuestableComponent, storage: questable, event: QuestableEvent);
    impl QuestableInternalImpl = QuestableComponent::InternalImpl<ContractState>;

    // Storage

    #[storage]
    struct Storage {
        #[substorage(v0)]
        achievable: AchievableComponent::Storage,
        #[substorage(v0)]
        signable: SignableComponent::Storage,
        #[substorage(v0)]
        playable: PlayableComponent::Storage,
        #[substorage(v0)]
        questable: QuestableComponent::Storage,
    }

    // Events

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event {
        #[flat]
        AchievableEvent: AchievableComponent::Event,
        #[flat]
        SignableEvent: SignableComponent::Event,
        #[flat]
        PlayableEvent: PlayableComponent::Event,
        #[flat]
        QuestableEvent: QuestableComponent::Event,
    }

    // Constructor

    fn dojo_init(world: @IWorldDispatcher,) {
        self.questable.initialize(world);
    }

    // Implementations

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn signup(self: @ContractState, name: felt252) {
            self.signable.signup(self.world(), name);
            self.questable.assess(self.world(), Quest::Squire)
        }

        fn conquest(self: @ContractState) {
            self.playable.conquest(self.world());
            self.questable.assess(self.world(), Quest::Conqueror);
        }

        fn verify(self: @ContractState, quest: u8) {
            self.questable.assess(self.world(), quest.into())
        }
    }
}
