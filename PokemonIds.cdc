import Game from "./Game.cdc"

access(all) fun main(): [UInt64] {
    return Game.getIDs()
}