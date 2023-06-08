use cosmwasm_std::{Addr, Storage};
use cw_storage_plus::Item;
use serde::{Deserialize, Serialize};

use crate::core::{constants::STATE_KEY, error::ContractError};

pub const STATE: Item<State> = Item::new(STATE_KEY);

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq)]
pub struct State {
    pub owner: Addr,
}

impl State {
    pub fn new(owner: Addr) -> Self {
        State { owner }
    }
}

pub fn get(storage: &dyn Storage) -> Result<State, ContractError> {
    Ok(STATE.load(storage)?)
}

pub fn set(storage: &mut dyn Storage, state: &State) -> Result<(), ContractError> {
    Ok(STATE.save(storage, state)?)
}

#[cfg(test)]
mod tests {
    use cosmwasm_std::Addr;

    use provwasm_mocks::mock_provenance_dependencies;

    use crate::storage::state::{set, State};

    use super::get;

    #[test]
    fn test_invalid_get() {
        let deps = mock_provenance_dependencies();
        get(&deps.storage).unwrap_err();
    }

    #[test]
    fn test_get_set() {
        let mut deps = mock_provenance_dependencies();
        let expected = State::new(Addr::unchecked("addr1"));
        set(deps.as_mut().storage, &expected).unwrap();
        let state = get(&deps.storage).unwrap();
        assert_eq!(expected, state);
    }
}
