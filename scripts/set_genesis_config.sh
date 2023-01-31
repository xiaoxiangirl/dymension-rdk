#! /bin/bash

tmp=$(mktemp)

set_minting_params() {
    echo "setting minting params"
    # jq '.app_state.mint.minter.inflation = "0.300000000000000000"' genesis.json > "$tmp" && mv "$tmp" genesis.json


    # blocks_per_year= (1/block_time) * 31,536,000
    jq '.app_state.mint.params.blocks_per_year = "157680000"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
    # jq '.app_state.mint.params.goal_bonded = "0.670000000000000000"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
}


set_distribution_params() {
    echo "setting distribution params"
    jq '.app_state.distribution.params.base_proposer_reward = "0.8"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
    jq '.app_state.distribution.params.community_tax = "0.00002"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
}


set_gov_params() {
    echo "setting gov params"
    jq '.app_state.gov.deposit_params.min_deposit[0].denom = "urap"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
    # jq '.app_state.gov.tally_params.quorum = ""' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
    # jq '.app_state.gov.tally_params.threshold = ""' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
    # jq '.app_state.gov.tally_params.veto_threshold = ""' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
}

set_sequencers() {
    sequencerDefault='
    {
          "commission": {
            "commission_rates": {
              "max_change_rate": "0.000000000000000000",
              "max_rate": "0.000000000000000000",
              "rate": "0.000000000000000000"
            },
            "update_time": "1970-01-01T00:00:00Z"
          },
          "consensus_pubkey": {
            "@type": "/cosmos.crypto.ed25519.PubKey",
            "key": "JKrXVkf+lloT5hrrpq+rXCz5XFWTIjWNkCRSsol4ROk="
          },
          "delegator_shares": "0.000000000000000000",
          "description": {
            "details": "",
            "identity": "",
            "moniker": "rollapp-sequencer",
            "security_contact": "",
            "website": ""
          },
          "jailed": false,
          "min_self_delegation": "1",
          "operator_address": "rolvaloper1mj0gf8fxs0jwjtpjge3zfggqkqm6cugwken084",
          "status": "BOND_STATUS_UNBONDED",
          "tokens": "0",
          "unbonding_height": "0",
          "unbonding_time": "1970-01-01T00:00:00Z"
        }
    '

    echo "NOT SUPPORTED YET"
    #Add this default, and change consensus_pubkey.key and operator_address
    # jq  --arg seq '.app_state.sequencers.sequencers |= .+ $seq "urap"' "$GENESIS_FILE" > "$tmp" && mv "$tmp" "$GENESIS_FILE"
}