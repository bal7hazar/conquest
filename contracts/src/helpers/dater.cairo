#[generate_trait]
impl Dater of DateTrait {
    #[inline]
    fn day_from(timestamp: u64) -> u64 {
        (timestamp / 86400).try_into().unwrap()
    }

    #[inline]
    fn minute_from(timestamp: u64) -> u64 {
        (timestamp / 60).try_into().unwrap()
    }
}
