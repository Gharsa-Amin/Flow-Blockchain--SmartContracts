import Art from "./Art.cdc"

access(all) fun main(): [Int] {
    return Art.artPieces.keys
}