import Game from "./Game.cdc"

transaction (name: String, type: String) {
    prepare(signer: &Account) {
        // This section can be left empty as you're creating a new Pokemon.
    }

    execute {
        let newPokemon <- Game.createPokemon(name: name, type: type)
        log(newPokemon.details)
        destroy newPokemon // destroys the resource after use
    }
}
