mod msg;
mod querier;
mod query;
mod types;

pub use msg::{
    activate_marker, add_attribute, add_binary_attribute, add_json_attribute, add_string_attribute,
    add_uuid_attribute, bind_name, bind_name_unrestricted, burn_marker_supply, cancel_marker,
    create_marker, create_marker_with_type, delete_attributes, destroy_marker, finalize_marker,
    grant_marker_access, grant_marker_access_all, grant_marker_access_asset,
    grant_marker_access_supply, mint_marker_supply, revoke_marker_access, unbind_name,
    withdraw_marker_coins, AttributeMsgParams, MarkerMsgParams, NameMsgParams, ProvenanceMsg,
    ProvenanceMsgParams,
};
pub use querier::ProvenanceQuerier;
pub use query::{
    AttributeQueryParams, MarkerQueryParams, NameQueryParams, ProvenanceQuery,
    ProvenanceQueryParams, ScopeQueryParams,
};
pub use types::{
    Attribute, AttributeValueType, Attributes, Marker, MarkerPermission, Name, Names, Party,
    ProvenanceRoute, Record, RecordGroup, RecordInput, Scope,
};

// Indicate that smart contracts that use this lib can only be run on the provenance blockchain.
#[no_mangle]
extern "C" fn requires_provenance() {}
