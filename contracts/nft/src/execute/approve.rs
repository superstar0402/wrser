use cosmwasm_std::{DepsMut, Env, MessageInfo, Response};
use cw_utils::Expiration;

use crate::core::error::ContractError;
use crate::util::action::{Action, ActionType};
use crate::util::permission;

pub fn handle(
    deps: DepsMut,
    env: &Env,
    info: &MessageInfo,
    spender: &str,
    token_id: &str,
    expires: Option<Expiration>,
) -> Result<Response, ContractError> {
    permission::modify_approvals(deps, env, info, spender, token_id, true, expires)?;

    Ok(Response::default().set_action(ActionType::Approve))
}
