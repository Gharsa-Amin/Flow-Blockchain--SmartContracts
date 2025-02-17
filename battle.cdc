import Game from "./Game.cdc"

transaction(pokemonId1: UInt64, pokemonId2: UInt64) {
    prepare(signer: &Account) {}

    execute {
        Game.battle(pokemonId1: pokemonId1, pokemonId2: pokemonId2)
    }
}