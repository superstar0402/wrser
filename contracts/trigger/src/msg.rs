use cosmwasm_schema::{cw_serde, QueryResponses};
use cosmwasm_std::Uint64;

#[cw_serde]
pub enum Event {
    BlockHeightEvent { block_height: Uint64 },
    BlockTimeEvent,
    TransactionEvent,
}

#[cw_serde]
pub struct InitMsg {}

#[cw_serde]
pub enum ExecuteMsg {
    CreateTrigger { event: Event, to_address: String },
    DeleteTrigger {},
}

#[cw_serde]
#[derive(QueryResponses)]
pub enum QueryMsg {}
