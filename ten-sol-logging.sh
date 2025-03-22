solana airdrop 200 $(solana-keygen pubkey ./alice.json)
solana airdrop 100 $(solana-keygen pubkey ./bob.json)
solana airdrop 9.99 $(solana-keygen pubkey ./bob.json)
solana transfer --from ./alice.json $(solana-keygen pubkey ./bob.json) 25
solana transfer --from ./bob.json $(solana-keygen pubkey ./alice.json) 9.99
