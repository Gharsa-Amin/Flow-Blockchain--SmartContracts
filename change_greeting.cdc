import HelloWorld from "./HelloWorld.cdc"

transaction(myNewGreeting: String) {

  prepare(signer: &Account) {}

  execute {
    HelloWorld.changeGreeting(newGreeting: myNewGreeting)
    log("We're done!")
  }
}
//how to send transaction in Cadence! 