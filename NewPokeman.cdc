import Game from "./Game.cdc"

transaction(name: String, type: String) {
  // notice the `SaveValue` entitlement - this allows
  // us to call the `save` function
  prepare(signer: auth(SaveValue) &Account) {
    // create a new pokemon
    let newPokemon: @Game.Pokemon <- Game.createPokemon(name: name, type: type)
    // saves `newPokemon` to my account storage at this path:
    // /storage/MyPokemon
    signer.storage.save(<- newPokemon, to: /storage/MyPokemon)
  }

  execute {}
}