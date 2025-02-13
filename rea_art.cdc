import Art from "./Art.cdc"
access(all) fun main(id: Int): Art.ArtPiece? {
return Art.artPieces[id]
}
