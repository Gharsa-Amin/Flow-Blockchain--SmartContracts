import Game from "./Game.cdc"

access(all) fun main(id: UInt64): Game.PokemonDetails? {
    return Game.getPokemonDetails(id: id)
}