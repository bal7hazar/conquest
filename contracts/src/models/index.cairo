#[derive(IntrospectPacked, Copy, Drop, Serde)]
#[dojo::model]
pub struct Player {
    #[key]
    id: felt252,
    name: felt252,
}

#[derive(IntrospectPacked, Copy, Drop, Serde)]
#[dojo::model]
pub struct Tile {
    #[key]
    id: u32,
    player_id: felt252,
    time: u64,
}
