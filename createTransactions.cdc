import Game from "./Game.cdc"

transaction(name: String, type: String) {
    prepare(signer: &Account) {

    }

    execute {
        let newPokemon <- Game.createPokemon(name: name, type: type)
        log(newPokemon.details)
        Game.storePokemon(pokemon: <- newPokemon)
    }
}